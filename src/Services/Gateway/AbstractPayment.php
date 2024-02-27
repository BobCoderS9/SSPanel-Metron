<?php
/**
 * Created by PhpStorm.
 * User: tonyzou
 * Date: 2018/9/24
 * Time: 下午4:23
 */

namespace App\Services\Gateway;

use App\Models\Paylist;
use App\Models\Payback;
use App\Models\User;
use App\Models\Code;
use App\Services\MetronSetting;
use App\Controllers\MetronController;
use App\Utils\Telegram;
use Slim\Http\{Request, Response};
use App\Metron\{Metron, MtAuth, MtTelegram};

abstract class AbstractPayment
{
    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function purchase($request, $response, $args);

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function notify($request, $response, $args);

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function getReturnHTML($request, $response, $args);

    /**
     * @param Request   $request
     * @param Response  $response
     * @param array     $args
     */
    abstract public function getStatus($request, $response, $args);

    abstract public function getPurchaseHTML();

    public function postPayment($pid, $method)
    {
        $p = Paylist::where('tradeno', $pid)->first();

        if ($p->status == 1) {
            return ['errcode' => 0, 'errmsg' => '交易已完成'];
        }

        $p->status = 1;
        $p->save();
        $user = User::find($p->userid);
        $user->money = bcadd($user->money, $p->total, 2);
        $user->save();
        $codeq = new Code();
        $codeq->code = $method;
        $codeq->isused = 1;
        $codeq->type = -1;
        $codeq->number = $p->total;
        $codeq->usedatetime = date('Y-m-d H:i:s');
        $codeq->userid = $user->id;
        $codeq->save();
        
        if ($p->shop != null) {
            $p_buy = Metron::metronpay_buyshop($pid);
        }

        if ($user->ref_by != '' && $user->ref_by != 0 && $user->ref_by != null) {
            Metron::add_payback( User::find($user->ref_by), $user, $codeq->number);
        }

        if ($p->shop != null && MetronSetting::get('recharge_enable')){
            Metron::recharge($p, $user);
        }

        if ($_ENV['enable_donate'] == true) {
            if ($user->is_hide == 1) {
                Telegram::Send('一位不愿透露姓名的大老爷给我们捐了 ' . $codeq->number . ' 元!');
            } else {
                Telegram::Send($user->user_name . ' 大老爷给我们捐了 ' . $codeq->number . ' 元！');
            }
        }

        if (MetronSetting::get('Telegram_Payment') === true) {
            MtTelegram::SendPayment($user, $p, $codeq);
        }

        return ['errcode' => 1, 'errmsg' => '回调处理完成'];;
    }

    public static function generateGuid()
    {
        mt_srand((double)microtime() * 10000);
        $charid = strtoupper(md5(uniqid(mt_rand() + time(), true)));
        $hyphen = chr(45);
        $uuid = chr(123)
            . substr($charid, 0, 8) . $hyphen
            . substr($charid, 8, 4) . $hyphen
            . substr($charid, 12, 4) . $hyphen
            . substr($charid, 16, 4) . $hyphen
            . substr($charid, 20, 12)
            . chr(125);
        $uuid = str_replace(['}', '{', '-'], '', $uuid);
        $uuid = substr($uuid, 0, 8);
        return $uuid;
    }
}
