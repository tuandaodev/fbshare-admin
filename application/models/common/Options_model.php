<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Options_model extends CI_Model {
    
    private $table = "options";
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function get_option($name)
    {   
        $query = $this->db->query("SELECT value FROM {$this->table} WHERE name='$name'");
        
        if ($query->num_rows() > 0) {
            return $query->row()->value;
        } else {
            return FALSE;
        }
    }

    public function update_option($name, $value)
    {
        $data = array('value' => $value);
        
        $this->db->where('name', $name);
        $result = $this->db->update($this->table, $data);
        
        return $result;
    }
}
