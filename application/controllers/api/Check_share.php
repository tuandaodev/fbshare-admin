<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Chatfluel.php');

class Check_share extends CI_Controller {

    function __construct() {
         parent::__construct();
    }
    
    public function index() {
//        $access_token = "EAAAAUaZA8jlABALGHvzZBE4xbKQNCzm0F8KOdbAweW4X2CXTu3pgmYnuymswzZCZAIDcjvzHD94lTd2AOZASlvzRWnXtArzRlyfbLABRAQecgyGKp4gOOGFWU9GXuJWXexi94hCcoHzFT13a1BiFVq4xYdFmGhLz7ibSnItsZCmQZDZD";
        
        $user_access_token = $this->option->get_option('user_access_token');
        $page_id = $this->option->get_option('page_id');
        $post_id = $this->option->get_option('post_id');
        
        // Input
        $user_fb_id = $this->input->get('user_fb_id');
        
//        $obj = "326208034543057_532845900545935";
        $sharedpost_obj = "{$page_id}_{$post_id}";
        
        $call_user_posts = 'https://graph.facebook.com/v3.2/' . $user_fb_id . '?fields=posts{story,object_id,message_tags,type,parent_id}&access_token=' . $user_access_token;

        $data_user_posts = callAPI('GET', $call_user_posts, false);
        $data_user_posts = json_decode($data_user_posts, true);
        
//        echo "<pre>";
//        print_r($data_user_posts);
//        echo "</pre>";
        
        $response['result'] = -1;
        $response['has_shared'] = 0;
        $response['has_tags'] = 0;
        
        $count_shared = 0;
        if (isset($data_user_posts['posts']['data']) && !empty($data_user_posts['posts']['data'])) {
            $posts = $data_user_posts['posts']['data'];
            if (count($posts) > 0) {
                foreach ($posts as $post_key => $post) {
                    if (isset($post['parent_id']) && $post['parent_id'] == $sharedpost_obj) {
                        $response['has_shared'] = 1;
                        $response['result'] = 0;
                        if (isset($posts[$post_key]['message_tags']) && !empty($posts[$post_key]['message_tags'])) {
                            if (count($posts[$post_key]['message_tags']) > 2) {
                                $response['result'] = 1;
                                $response['has_tags'] = 1;
                                
                                $count_shared = count($posts[$post_key]['message_tags']);
                                break;
                            } else {
                                $count_shared = count($posts[$post_key]['message_tags']);
                            }
                        } 
                    }
                }
            }
        }
        
        $user_attr['has_shared'] = $response['has_shared'];
        $user_attr['has_tags'] = $response['has_tags'];
        
        if ($response['result'] == 1) {
            $messages[] = array('text' => "Cảm ơn bạn đã chia sẻ và tag {$count_shared} bạn bè. Bạn thực hiện các bước tiếp theo nhé!");
        } elseif ($response['result'] == 0) {
            if ($count_shared > 0 && $count_shared < 3) {
                $messages[] = array('text' => "Bạn chia sẻ bài viết nhưng chỉ tag {$count_shared} bạn bè thôi. Bạn tag thêm để đủ 3 bạn bè vào bài viết rồi quay lại nhé!");
            } else {
                $messages[] = array('text' => "Bạn chia sẻ bài viết nhưng quên tag bạn bè rồi. Bạn tag thêm 3 bạn bè vào bài viết rồi quay lại nhé!");
            }
        } else {
            $messages[] = array('text' => "Bạn chưa chia sẻ và tag bạn bè. Bạn chia sẻ bài viết và tag 3 bạn bè vào rồi quay lại sau nhé!");
        }

        $res['set_attributes'] = $user_attr;
        $res['messages'] = $messages;
        
        header('Content-Type: application/json');
        echo json_encode($res);
        exit;
    }
    
    public function index2() {
        
        $has_shared = $this->input->get('has_shared');
        
        if (!$has_shared) {
            $response = [];
            echo json_encode($response);
            exit;
        }
        
        echo $check_url;
        
        $response = [];
        if (isset($has_shared) && $has_shared == "1") {
            
            $user_attr['has_shared'] = "1";
            
            $messages[] = array('text' => "Bạn đã share bài viết. Cảm ơn bạn.");
            $messages[] = array('text' => "Mời bạn làm các bước tiếp theo nhé!");
            
            $response['set_attributes'] = $user_attr;
            $response['messages'] = $messages;
            
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        } else {
            $user_attr['has_shared'] = "0";
            
            $messages[] = array('text' => "Bạn chưa chia sẻ bài viết. Bạn chia sẻ rồi quay lại nhé.");
            
            $response['set_attributes'] = $user_attr;
            $response['messages'] = $messages;
            
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }
        
        exit();
    }
    
}