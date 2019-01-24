<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Shared extends CI_Controller {

    function __construct() {
         parent::__construct();
    }

    public function index() {
       
    }
    
    public function main($user_id) {
        if (!$user_id) {
            $res['result'] = 0;
            $res['message'] = "Missing User ID";
            
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }
        
        $bot_id = "5a5b0d9ee4b0d02fdb4c8b17";
        $token = "vnbqX6cpvXUXFcOKr5RHJ7psSpHDRzO1hXBY8dkvn50ZkZyWML3YdtoCnKH7FSjC";
        
        $data['chatfuel_token'] = $token;
        
        $error_code = $this->input->get('error_code'); //code=4201
        if ($error_code) {
            // User didn't share the post
//            $data['chatfuel_block_name'] = "5c49d3d676ccbc2e60910542";  //User_not_shared
            $data['chatfuel_block_name'] = "User_not_shared";  //User_not_shared
            $data['has_shared'] = 0;
        } else {
            // User shared the post
//            $data['chatfuel_block_name'] = "5c49d37c76ccbc2e608d8502"; //User_shared
            $data['chatfuel_block_name'] = "User_shared"; //User_shared
            $data['has_shared'] = 1;
        }
        
        $chatfuel_url = "https://api.chatfuel.com/bots/{$bot_id}/users/{$user_id}/send?chatfuel_token={$token}&chatfuel_block_name={$data['chatfuel_block_name']}";
        
        $make_call = callAPI('POST', $chatfuel_url, json_encode($data));
        $response = json_decode($make_call, true);
        
        if ($error_code) {
            echo "Chia sẻ bài viết thất bại. Bạn quay lại facebook và thử lại nhé!";
        } else {
            echo "Chia sẻ bài viết thành công. Bạn quay lại facebook và làm các bước còn lại để tham gia sự kiện nhé!";
        }
        exit;
    }
    
}