<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Gift extends CI_Controller {

    function __construct() {
         parent::__construct();
    }

    public function send_gift() {
        $gift_message = $this->option->get_option("gift_message");
        header('Content-Type: application/json');
        echo $gift_message;
        exit;
    }
    
    public function save_gift() {

        $messenger_user_id = $this->input->post('messenger_user_id');
        
        $gift_id = $this->input->post('user_gift_id');
        $gift_name = $this->input->post('user_gift_name');
        
        if (!$messenger_user_id) {
            return;
        }

        $client_data = array(
            'user_app_id' => $messenger_user_id, 
            'gift_id' => $gift_id, 
            'gift_name' => $gift_name, 
        );
        
        $result = $this->client_model->insert_update($client_data);
        
        if ($result) {
            $messages[] = array('text' => "[Đã Cập nhật quà tặng trên Database]");
            $response['messages'] = $messages;
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        } else {
            $messages[] = array('text' => "Log Query: " . $this->db->last_query());
            $response['messages'] = $messages;
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }
        
    }
}