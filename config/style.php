<?php 

# 浅色主题
$_style['primary'] = [
    'global' => [
        'title'             => 'text-primary',
        'text'              => 'text-dark-75',
        'svg'               => 'svg-icon-primary',
        'btn_subheader'     => 'btn-white',
    ],
    'modal' => [
        'text_title' => 'text-dark',
        'btn_close'  => 'btn-light-primary',
    ],
    'alert' => 'alert-white',
    'index'  => [
        'dash1' => [
            'bg'  => 'bg-diagonal bg-diagonal-light-primary',
            'svg' => 'svg-icon-primary',
        ],
        'dash2' => [
            'bg'  => 'bg-diagonal bg-diagonal-light-success',
            'svg' => 'svg-icon-success',
            'btn' => 'label-success',
        ],
        'dash3' => [
            'bg'  => 'bg-diagonal bg-diagonal-light-warning',
            'svg' => 'svg-icon-warning',
        ],
        'dash4' => [
            'bg'  => 'bg-diagonal bg-diagonal-light-danger',
            'svg' => 'svg-icon-danger',
        ],
        'text' => 'text-dark',
    ],
    'shop' => [
        'card_head' => 'bg-radial-gradient-primary bg-gray-100',
        'card_bg'   => 'bg-white',
        'card_text' => 'text-dark-75',
        'card_btn'  => 'btn-primary',
    ],
    'shared' => [
        'item'   => 'bg-white text-dark',
    ],
    'help' => [
        'search_bg' => 'bg-white',
    ],
    'JavaScript' => json_encode([
        'theme' => 'primary',
        'global' => [
            'gray' => [
                '100' => '#F3F6F9',
                '200' => '#ECF0F3',
                '300' => '#E5EAEE',
                '400' => '#D6D6E0',
                '500' => '#B5B5C3',
                '600' => '#80808F',
                '700' => '#464E5F',
                '800' => '#1B283F',
                '900' => '#212121',
            ],
        ],
        'index' => [
            'flowTiaoChart' => [
                'strip' => '#6993FF',
                'light' => '#E1E9FF',
                'text'  => '#464E5F',
            ],
        ],
    ]),
];
# 深色主题
$_style['dark'] = [
    'global' => [
        'title'             => 'text-primary',
        'text'              => 'text-white',
        'svg'               => 'svg-icon-white',
        'btn_subheader'     => 'btn-gray',
    ],
    'modal' => [
        'text_title' => 'text-white',
        'btn_close'  => 'btn-gray',
    ],
    'alert' => 'alert-gray',
    'index'  => [
        'dash1' => [
            'bg'  => 'bg-card-dark',
            'svg' => 'svg-icon-primary',
        ],
        'dash2' => [
            'bg'  => 'bg-card-dark',
            'svg' => 'svg-icon-success',
            'btn' => 'label-success',
        ],
        'dash3' => [
            'bg'  => 'bg-card-dark',
            'svg' => 'svg-icon-warning',
        ],
        'dash4' => [
            'bg'  => 'bg-card-dark',
            'svg' => 'svg-icon-danger',
        ],
        'text' => 'text-white',
    ],
    'shop' => [
        'card_head' => 'bg-radial-gradient-dark-head',
        'card_bg'   => 'bg-card-dark',
        'card_text' => 'text-white',
        'card_btn'  => 'btn-gray',
    ],
    'shared' => [
        'item'   => 'bg-card-dark text-white',
    ],
    'help' => [
        'search_bg' => 'bg-input-dark',
    ],
    'JavaScript' => json_encode([
        'theme' => 'dark',
        'global' => [
            'gray' => [
                '100' => '#F3F6F9',
                '200' => '#ECF0F3',
                '300' => '#E5EAEE',
                '400' => '#D6D6E0',
                '500' => '#B5B5C3',
                '600' => '#80808F',
                '700' => '#464E5F',
                '800' => '#1B283F',
                '900' => '#212121',
            ],
        ],
        'index' => [
            'flowTiaoChart' => [
                'strip'     => '#6993FF',
                'light'     => '#3a3b3c',
                'text'      => '#FFFFFF',
            ],
        ],
    ]),
];
