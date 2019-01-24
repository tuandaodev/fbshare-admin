<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Go_share extends CI_Controller {

    function __construct() {
         parent::__construct();
    }

    public function index() {
       
    }
    
    public function main($user_id) {
        
        $post_url = "https://www.facebook.com/permalink.php?story_fbid=532845900545935&id=326208034543057";
        $app_id = "1721288211334117";
        
        $share_link = "https://www.facebook.com/dialog/share?app_id={$app_id}&display=page&href={$post_url}&redirect_uri=http://zapi.cloud/api/shared/{$user_id}";
        
        echo '<meta http-equiv="refresh" content="0; url=' . $share_link . '" />';
        exit();
        
    }
    
}