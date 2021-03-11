<?php

namespace app\Classes;

class RestApiVk {

    static $method_url='https://api.vk.com/method/';
    static $access_token_url='https://oauth.vk.com/access_token';
    static $authorize_url='https://oauth.vk.com/authorize';
    static $v='5.130';

    public static function request(string $url,array $params)
    {
        $opts = self::getOptions($params);
        $res = file_get_contents($url, false, $opts);
        return json_decode($res,true);
    }

    public static function getAccessToken(array $params)
    {
        return self::request(self::$access_token_url, $params);
    }

    public static function Authorization(array $params)
    {
        $params['v']=self::$v;
        return self::request(self::$authorize_url, $params);
    }
    
    public static function  getOptions(array $content)
    {
        $content=http_build_query($content);
        $http=['http'=>[
            'method'=>"POST",
            'content'=>$content,
            'header'=>['Content-Type: application/x-www-form-urlencoded','Content-Length: '.mb_strlen($content."\r\n")],
            'protocol_version' => 1.1,
            'ignore_errors' => false,
            'timeout'=>30,
          ],
            'ssl' =>[
                        'verify_peer'=> false,
                        'verify_peer_name'=>false,
                        'verify_depth'      => 0,
                        'allow_self_signed' => true,
                    ]
        ];
        return stream_context_create($http);
    }
}