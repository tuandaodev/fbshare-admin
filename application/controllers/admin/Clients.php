<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clients extends Admin_Controller {

    public function __construct()
    {
        parent::__construct();

        /* Load :: Common */
        $this->breadcrumbs->unshift(1, "Clients", 'admin/clients');
        $this->load->model('common/client_model');
    }


	public function index()
	{
        if ( ! $this->ion_auth->logged_in() OR ! $this->ion_auth->is_admin())
        {
            redirect('auth/login', 'refresh');
        }
        else
        {

            // print_r($this->router->get_controll);
            // exit;

            /* Title Page */
            $this->page_title->push("Client List");
            $this->data['pagetitle'] = $this->page_title->show();

            /* Breadcrumbs */
            $this->data['breadcrumb'] = $this->breadcrumbs->show();

            /* Data */
            $this->data['message_public'] = (validation_errors()) ? validation_errors() : NULL;
            $this->data['client_list'] = $this->client_model->get_clients();

            $this->template->admin_render('admin/clients/index', $this->data);
        }
    }
    
    public function export_client()
	{
		if ( ! $this->ion_auth->logged_in() OR ! $this->ion_auth->is_admin())
		{
			redirect('auth', 'refresh');
		}
        else
        {

            redirect('admin/clients', 'refresh');
        }
	}

}
