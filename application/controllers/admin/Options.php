<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Options extends Admin_Controller {

    public function __construct()
    {
        parent::__construct();

        /* Load :: Common */
        $this->breadcrumbs->unshift(1, "Options", 'admin/options');
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
            $this->data['options'] = $this->option->get_options();

            if ($this->form_validation->run() == TRUE)
            {
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
