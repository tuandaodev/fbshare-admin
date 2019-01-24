<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Save_client extends CI_Controller {

    function __construct() {
         parent::__construct();
    }

    public function index() {
    }
    
    public function write_excel() {
        
        $export_dir = FCPATH . 'export';
        if(!is_dir($export_dir)){
            mkdir($export_dir);
        }
        $export_file = "/export.csv";
        
        $export_path = $export_dir . $export_file;
        
        $messenger_user_id = $this->input->post('messenger_user_id');
//        if (!$messenger_user_id) $messenger_user_id = "None";
        $fb_id = $this->input->post('user_fb_id');
//        if (!$fb_id) $fb_id = "None";
        $first_name = $this->input->post('first_name');
//        if (!$first_name) $first_name = "None";
        $last_name = $this->input->post('last_name');
//        if (!$last_name) $last_name = "None";
        
        $user_phone = $this->input->post('user_phone');
//        if (!$user_phone) $user_phone = "None";
        $user_location = $this->input->post('user_location');
//        if (!$user_location) $user_location = "None";
        
        $gender = $this->input->post('gender');
//        if (!$gender) $gender = "None";
        
        $user_fb_url = $this->input->post('user_fb_url');
//        if (!$user_fb_url) $user_fb_url = "None";
        
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $date = date('m/d/Y h:i:s a', time());
        
        $export_data = array($messenger_user_id, $fb_id, $first_name, $last_name, $user_phone, $user_location, $gender, $user_fb_url, $date);
        
        $file = fopen($export_path, "a");
        
//        echo $export_dir;
//        echo "<pre>";
//        print_r($export_data);
//        echo "</pre>";
//        $export_text = explode(',',$export_data);
//        
//        echo $export_text;
        
        fputcsv($file, $export_data);

        fclose($file);
        
        //logs
        
//        $log_text = json_encode($_REQUEST);
//        $log_text .= json_encode($_POST);
//        
//        $export_path = $export_dir . "/log.txt";
//        $fp = fopen($export_path, 'w');
//        fwrite($fp, $log_text);
//        fclose($fp);
        
        exit;
    }
}