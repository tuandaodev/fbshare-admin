<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Test extends CI_Controller {

    function __construct() {
         parent::__construct();
         $this->load->helper('url');
         $this->load->model('common/client_model');
    }
    
    public function index() {
        
        $test = base_url();
        
        $data['user_fb_id'] = "123123123";
        $data['user_app_id'] = "6767456456546";
        $this->client_model->insert($data);
        
        
//        $page_id = $this->option->get_option("page_id");
//        
//        $updated = $this->option->update_option('user_access_token', 'testdone');
//        
//        echo "<pre>";
//        print_r($page_id);
//        print_r($updated);
//        echo "</pre>";
//        exit;
    }
    
}