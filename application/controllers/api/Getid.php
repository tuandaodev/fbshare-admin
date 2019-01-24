<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Getid extends CI_Controller {

    function __construct() {
         parent::__construct();
    }

    public function index() {
        
        $Chatfluel = new Chatfuel();
        
        $fb_url = $this->input->get('url');
        
        $get_data = callAPI('GET', 'https://api.httzip.com/get-facebook-id?url='.$fb_url, false);
        $get_data = json_decode($get_data, true);
        
        $response = [];
        if (isset($get_data['id']) && !empty($get_data['id'])) {
            $user_attr['user_fb_id'] = $get_data['id'];
            $user_attr['has_fb_id'] = "1";
            
            $messages[] = array('text' => "FB ID của bạn là: " . $user_attr['user_fb_id']);
            $messages[] = array('text' => "Cảm ơn bạn");
            
            $response['set_attributes'] = $user_attr;
            $response['messages'] = $messages;
            
//            $Chatfluel->sendText($messages);
            
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }
        
        exit();
    }
}