<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Client_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_clients()
    {
        $query = $this->db->query("SELECT * FROM clients");
        
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return FALSE;
        }
    }

    public function get_client($id)
    {
        $query = $this->db->query("SELECT * FROM clients WHERE id='$id'");
        
        if ($query->num_rows() > 0) {
            return $query->row_array();
        } else {
            return FALSE;
        }
    }
    
    public function get_client_by_fbid($user_fb_id)
    {
        $query = $this->db->query("SELECT * FROM clients WHERE user_fb_id='$user_fb_id'");
        
        if ($query->num_rows() > 0) {
            return $query->row_array();
        } else {
            return FALSE;
        }
    }
    
    public function get_client_by_appid($user_app_id)
    {
        $query = $this->db->query("SELECT * FROM clients WHERE user_app_id='$user_app_id'");
        
        if ($query->num_rows() > 0) {
            return $query->row_array();
        } else {
            return FALSE;
        }
    }

    public function update_by_appid($data, $user_app_id)
    {
        $where = " user_app_id = '$user_app_id' ";

        return $this->db->update('clients', $data, $where);
    }
    
    public function insert($data)
    {
        $this->db->insert('clients', $data);
        $last_id = $this->db->insert_id();
        
        return $last_id;
    }
    
    public function insert_update($data) {
        $query = $this->db->query("SELECT id FROM clients WHERE user_app_id='{$data['user_app_id']}'");
        if ($query->num_rows() > 0) {
//            $client_id = $query->row()->id;
            $user_app_id = $data['user_app_id'];
            unset($data['user_app_id']);

            date_default_timezone_set('Asia/Ho_Chi_Minh');
            $date = date('Y/m/d H:i:s', time());
            $data['updated'] = $date;

            return $this->update_by_appid($data, $user_app_id);
        } else {
            return $this->insert($data);
        }
    }
    
    public function get_fbid_by_appid($user_app_id)
    {
        $query = $this->db->query("SELECT user_fb_id FROM clients WHERE user_app_id='$user_app_id'");
        
        if ($query->num_rows() > 0) {
            return $query->row()->user_fb_id;
        } else {
            return FALSE;
        }
    }
}
