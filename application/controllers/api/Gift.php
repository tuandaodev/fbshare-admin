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
    
}