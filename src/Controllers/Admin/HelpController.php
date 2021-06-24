<?php

namespace App\Controllers\Admin;

use App\Controllers\{MetronController, AdminController};
use App\Models\{ Help, User, Helpc };
use App\Utils\{ Telegram, DatatablesHelper };
use App\Services\Mail;
use App\Metron\{Metron, MtAuth};
use Ozdemir\Datatables\Datatables;
use Exception;

class HelpController extends AdminController
{
    public function index($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die('授权失败');
        }

        $table_config['total_column'] = array(
            'op' => '操作',
            'id' => 'ID',
            'title' => '标题',
            'content' => '内容',
            'class' => '分类',
            'add_time' => '创建时间',
            'ontop' => '是否置顶',
            'sort' => '排序',
        );
        $table_config['default_show_column'] = array(
            'op',
            'id',
            'title',
            'content',
            'class',
            'add_time',
            'ontop',
            'sort',
        );

        $table_config['ajax_url'] = '/admin/help/document/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/help/document/index.tpl');
    }

    public function create($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die('授权失败');
        }

        $helpClass1 = Helpc::where('upid', '0')->orderBy('id', 'asc')->get();
        return $this->view()->assign('helpClass1', $helpClass1)->display('admin/help/document/create.tpl');
    }

    public function add($request, $response, $args)
    {
        $title   = $request->getParam('title');
        $content = $request->getParam('content');
        $class1  = $request->getParam('class1');
        $class2  = $request->getParam('class2');
        $ontop   = $request->getParam('isontop');
        $sort    = $request->getParam('sort');

        if ($class1==0) {
            $rs['ret'] = 0;
            $rs['msg'] = '请选择一级分类';
            return $response->getBody()->write(json_encode($rs));
        }
        if ($class2==0) {
            $rs['ret'] = 0;
            $rs['msg'] = '请选择二级分类';
            return $response->getBody()->write(json_encode($rs));
        }

        $help = new Help();
        $help->title = $title;
        $help->content = $content;
        $help->markdown = $request->getParam('markdown');
        $help->class = $class2;
        $help->ontop = $ontop;
        $help->add_time = date('Y-m-d H:i:s');
        $help->sort = $sort;
        if (!$help->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = '添加失败';
            return $response->getBody()->write(json_encode($rs));
        }

        $rs['ret'] = 1;
        $rs['msg'] = '添加成功';
        return $response->getBody()->write(json_encode($rs));
    }

    public function edit($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die('授权失败');
        }

        $id = $args['id'];
        $help = Help::find($id);
        $helpUpid = Helpc::where('id', $help->class)->value('upid');    /* 获取文档的一级分类ID */
        $helpClass1 = Helpc::where('upid', '0')->orderBy('id', 'asc')->get();   /* 列出所有一级分类 */
        $helpClass2 = Helpc::where('upid', '=', $helpUpid)->orderBy('id', 'asc')->get();    /* 列出当前文档的相同一级分类的二级分类 */

        return $this->view()
            ->assign('help', $help)
            ->assign('helpUpid', $helpUpid)
            ->assign('helpClass1', $helpClass1)
            ->assign('helpClass2', $helpClass2)
            ->display('admin/help/document/edit.tpl');
    }

    public function update($request, $response, $args)
    {
        $title = $request->getParam('title');
        $content = $request->getParam('content');
        $class1 = $request->getParam('class1');
        $class2 = $request->getParam('class2');
        $ontop = $request->getParam('isontop');
        $sort  = $request->getParam('sort');
        if ($class1==0) {
            $rs['ret'] = 0;
            $rs['msg'] = '请选择一级分类';
            return $response->getBody()->write(json_encode($rs));
        }
        if ($class2==0) {
            $rs['ret'] = 0;
            $rs['msg'] = '请选择二级分类';
            return $response->getBody()->write(json_encode($rs));
        }

        $id = $args['id'];
        $help = Help::find($id);

        $help->title = $title;
        $help->content = $content;
        $help->markdown = $request->getParam('markdown');
        $help->class = $class2;
        $help->ontop = $ontop;
        $help->add_time = date('Y-m-d H:i:s');
        $help->sort = $sort;
        if (!$help->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = '修改失败';
            return $response->getBody()->write(json_encode($rs));
        }

        $rs['ret'] = 1;
        $rs['msg'] = '修改成功';
        return $response->getBody()->write(json_encode($rs));
    }

    public function delete($request, $response, $args)
    {
        $id = $request->getParam('id');
        $help = Help::find($id);
        if (!$help->delete()) {
            $rs['ret'] = 0;
            $rs['msg'] = '删除失败';
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = '删除成功';
        return $response->getBody()->write(json_encode($rs));
    }

    public function ajax($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select id as op,id,title,content,class,add_time,ontop,sort from help');

        $datatables->edit('op', static function ($data) {
            return '<a class="btn btn-brand" href="/admin/help/document/' . $data['id'] . '/edit">编辑</a>
                    <a class="btn btn-brand-accent" id="delete" value="' . $data['id'] . '" href="javascript:void(0);" onClick="delete_modal_show(\'' . $data['id'] . '\')">删除</a>';
        });

        $datatables->edit('class', static function ($data) {
            $class2 = Helpc::where('id', $data['class'])->first();
            $class1 = Helpc::where('id', $class2->upid)->value('name');
            return '1级：'.$class1.'<br />2级：'.$class2->name;
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }

    public function getHelpClass($request, $response, $args)
    {
        $id = $request->getParam('id');

        if (!$id) {
            $res = Helpc::where('upid', '=', 0)->orderBy('id', 'asc')->get();
            return $response->getBody()->write(json_encode($res));
        }

        $helpClass2s = Helpc::where('upid', '=', $id)->orderBy('id', 'asc')->get();
        if (count($helpClass2s) == 0) {
            $res['ret'] = 0;
            $res['msg'] = '该分类没有数据';
            return $response->getBody()->write(json_encode($res));
        }

        return $response->getBody()->write(json_encode($helpClass2s));
    }

    /**
     * 分类管理
     */

    public function class_index($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die('授权失败');
        }

        $table_config['total_column'] = array(
            'op' => '操作',
            'id' => 'ID',
            'name' => '分类名称',
            'upid' => '上级分类',
            'li' => '图标',
            'pageshow' => '页面显示',
            'sort' => '排序',
        );
        $table_config['default_show_column'] = array(
            'op',
            'id',
            'name',
            'upid',
            'li',
            'pageshow',
            'sort',
        );

        $table_config['ajax_url'] = '/admin/help/class/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/help/class/index.tpl');
    }

    public function class_create($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die('授权失败');
        }

        return $this->view()->display('admin/help/class/create.tpl');
    }

    public function class_add($request, $response, $args)
    {
        $name     = $request->getParam('name');
        $classji  = $request->getParam('classji');
        $class1ji = $request->getParam('class1ji');
        $pageshow = $request->getParam('pageshow');
        $ico      = $request->getParam('ico');
        $sort     = $request->getParam('sort');

        if (!$name) {
            $rs['ret'] = 0;
            $rs['msg'] = '分类名称不能为空';
            return $response->getBody()->write(json_encode($rs));
        }
        if ($classji == 2 && $class1ji == 0) {
            $rs['ret'] = 0;
            $rs['msg'] = '请选择一级分类';
            return $response->getBody()->write(json_encode($rs));
        }

        $helpc           = new Helpc();
        $helpc->name     = $name;
        $helpc->upid     = ($classji == 2 ? $class1ji : 0);
        $helpc->pageshow = $pageshow;
        $helpc->li       = $ico;
        $helpc->sort     = $sort;

        if (!$helpc->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = '添加失败';
            return $response->getBody()->write(json_encode($rs));
        }

        $rs['ret'] = 1;
        $rs['msg'] = '添加成功';
        return $response->getBody()->write(json_encode($rs));
    }

    public function class_edit($request, $response, $args)
    {
        $mt = MtAuth::Auth();
        if (!$mt['ret']) {
            die('授权失败');
        }

        $id = $args['id'];
        $helpc = Helpc::find($id);
        $helpUpid = Helpc::where('id', $helpc->class)->value('upid');    /* 获取文档的一级分类ID */
        $helpClass1 = Helpc::where('upid', '0')->orderBy('id', 'asc')->get();   /* 列出所有一级分类 */
        $helpClass2 = Helpc::where('upid', '=', $helpUpid)->orderBy('id', 'asc')->get();    /* 列出当前文档的相同一级分类的二级分类 */

        return $this->view()
            ->assign('helpc', $helpc)
            ->assign('helpUpid', $helpUpid)
            ->assign('helpClass1', $helpClass1)
            ->assign('helpClass2', $helpClass2)
            ->display('admin/help/class/edit.tpl');
    }

    public function class_update($request, $response, $args)
    {
        $name     = $request->getParam('name');
        $classji  = $request->getParam('classji');
        $class1ji = $request->getParam('class1ji');
        $pageshow = $request->getParam('pageshow');
        $ico      = $request->getParam('ico');
        $sort      = $request->getParam('sort');

        if (!$name) {
            $rs['ret'] = 0;
            $rs['msg'] = '分类名称不能为空';
            return $response->getBody()->write(json_encode($rs));
        }
        if ($classji == 2 && $class1ji == 0) {
            $rs['ret'] = 0;
            $rs['msg'] = '请选择一级分类';
            return $response->getBody()->write(json_encode($rs));
        }

        $id              = $args['id'];
        $helpc           = Helpc::find($id);
        $helpc->name     = $name;
        $helpc->upid     = ($classji == 2 ? $class1ji : 0);
        $helpc->pageshow = $pageshow;
        $helpc->li       = $ico;
        $helpc->sort     = $sort;

        if (!$helpc->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = '修改失败';
            return $response->getBody()->write(json_encode($rs));
        }

        $rs['ret'] = 1;
        $rs['msg'] = '修改成功';
        return $response->getBody()->write(json_encode($rs));
    }

    public function class_delete($request, $response, $args)
    {
        $id = $request->getParam('id');
        $helpc = Helpc::find($id);

        if (!$helpc->delete()) {
            $rs['ret'] = 0;
            $rs['msg'] = '删除失败';
            return $response->getBody()->write(json_encode($rs));
        }

        $rs['ret'] = 1;
        $rs['msg'] = '删除成功';
        return $response->getBody()->write(json_encode($rs));
    }

    public function class_ajax($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select id as op,id,name,upid,li,pageshow,sort from help_class');

        $datatables->edit('op', static function ($data) {
            return '<a class="btn btn-brand" href="/admin/help/class/' . $data['id'] . '/edit">编辑</a>
                    <a class="btn btn-brand-accent" id="delete" value="' . $data['id'] . '" href="javascript:void(0);" onClick="delete_modal_show(\'' . $data['id'] . '\')">删除</a>';
        });

        $datatables->edit('upid', static function ($data) {
            $upid_name = Helpc::where('id', $data['upid'])->value('name');
            $name = $upid_name ? : '这是一级分类';
            return $name;
        });

        $datatables->edit('pageshow', static function ($data) {
                $name = ($data['pageshow'] ? $data['pageshow'] === 2 ? '回收站' : '显示' : '不显示');
            return $name;
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }
}
