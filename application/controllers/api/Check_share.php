<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Check_share extends CI_Controller {

    function __construct() {
         parent::__construct();
    }

    public function index() {
        
        $has_shared = $this->input->get('has_shared');
        
        if (!$has_shared) {
            $response = [];
            echo json_encode($response);
            exit;
        }
        
        echo $check_url;
        
        $response = [];
        if (isset($has_shared) && $has_shared == "1") {
            
            $user_attr['has_shared'] = "1";
            
            $messages[] = array('text' => "Bạn đã share bài viết. Cảm ơn bạn.");
            $messages[] = array('text' => "Mời bạn làm các bước tiếp theo nhé!");
            
            $response['set_attributes'] = $user_attr;
            $response['messages'] = $messages;
            $response['redirect_to_blocks'][] = ""
            
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        } else {
            $user_attr['has_shared'] = "0";
            
            $messages[] = array('text' => "Bạn chưa chia sẻ bài viết. Bạn chia sẻ rồi quay lại nhé.");
            
            $response['set_attributes'] = $user_attr;
            $response['messages'] = $messages;
            
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }
        
        exit();
    }
    
}