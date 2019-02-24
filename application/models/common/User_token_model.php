<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_token_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_tokens()
    {
        $query = $this->db->query("SELECT * FROM user_token");
        
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return FALSE;
        }
    }

    public function get_token($id)
    {
        $query = $this->db->query("SELECT * FROM user_token WHERE id='$id'");
        
        if ($query->num_rows() > 0) {
            return $query->row_array();
        } else {
            return FALSE;
        }
    }
    
    public function update($data, $id)
    {
        $where = " id = '$id' ";

        return $this->db->update('user_token', $data, $where);
    }
    
    public function delete($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete('user_token');
    }
    
    public function insert($data)
    {
        $this->db->insert('user_token', $data);
        $last_id = $this->db->insert_id();
        
        return $last_id;
    }
    
    public function get_gifts_by_ids($ids)
    {
        $query = $this->db->query("SELECT * FROM gifts WHERE id IN ($ids)");
        
//        echo $this->db->last_query();
//        exit;   
        
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return FALSE;
        }
    }
    
}
