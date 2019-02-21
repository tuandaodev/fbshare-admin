<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Options extends Admin_Controller {

    public function __construct()
    {
        parent::__construct();

        /* Load :: Common */
        $this->breadcrumbs->unshift(1, "Options", 'admin/options');
        $this->load->model('common/gift_model');
    }

    private function build_gift_message($gifts) {
        
        $gift_message = '';
        $quick_replies = [];
        
        if (count($gifts) > 0) {
            $gift_ids = implode(',', $gifts);

            $gift_list = $this->gift_model->get_gifts_by_ids($gift_ids);
            foreach ($gift_list as $gift) {
                $gift_obj = array("title" => $gift['name'], "set_attributes" => array("user_gift_id" => $gift['id'], "user_gift_name" => $gift['name']));
                $quick_replies[] = $gift_obj;
            }
        } else {
            return $gift_message;
        }
        
        $messages[] = array('text' => "text", "quick_replies" => $quick_replies, "quick_reply_options" => array("process_text_by_ai" => false, "text_attribute_name" => "user_message"));
        

        $res['messages'] = $messages;
        
//        header('Content-Type: application/json');
//        echo "<pre>";
//        print_r($res);
//        echo "</pre>";
//        exit;
        
        $gift_message = json_encode($res);
        return $gift_message;
    }
    
    public function index()
    {
        if ( ! $this->ion_auth->logged_in() OR ! $this->ion_auth->is_admin())
        {
            redirect('auth/login', 'refresh');
        }
        else
        {
            /* Title Page */
            $this->page_title->push("Options");
            $this->data['pagetitle'] = $this->page_title->show();

            /* Breadcrumbs */
            $this->data['breadcrumb'] = $this->breadcrumbs->show();

            // print_r($this->data);
            // exit;

            /* Validate form input */
            $this->form_validation->set_rules('page_id', "Required", 'required');

            /* Data */
            $this->data['message_public']        = (validation_errors()) ? validation_errors() : NULL;
            $this->data['options_text'] = $this->option->get_options_text();
            $this->data['option_gift'] = $this->option->get_option_gift();
            
            $this->data['gift_list'] = $this->gift_model->get_gifts();
            $this->data['gift_list_selected'] = unserialize($this->option->get_option('list_gift'));
            
            if ($this->form_validation->run() == TRUE)
            {
                $gifts = $this->input->post('list_gift');
                
                //Build Gift Message
                $gift_message = $this->build_gift_message($gifts);
                
                $data = array(
                    'page_id' => $this->input->post('page_id'),
                    'post_id' => $this->input->post('post_id'),
                    'page_access_token' => $this->input->post('page_access_token'),
                    'user_access_token' => $this->input->post('user_access_token'),
                    'crawler_api_url' => $this->input->post('crawler_api_url'),
                    'chatfuel_bot_id' => $this->input->post('chatfuel_bot_id'),
                    'chatfuel_token' => $this->input->post('chatfuel_token'),
                    'chatfuel_block_get_user_info' => $this->input->post('chatfuel_block_get_user_info'),
                    'chatfuel_block_user_shared' => $this->input->post('chatfuel_block_user_shared'),
                    'chatfuel_block_user_not_shared' => $this->input->post('chatfuel_block_user_not_shared'),
                    'chatfuel_block_main_event' => $this->input->post('chatfuel_block_main_event'),
                    'list_gift' => serialize($gifts),
                    'gift_message' => $gift_message
                );

                foreach ($data as $key => $value) {
                    $this->option->update_option($key, $value);
                }
                
                redirect('admin/options', 'refresh');
            }
            else
            {
                /* Load Template */
                $this->template->admin_render('admin/options/option', $this->data);
            }
        }
    }
}
