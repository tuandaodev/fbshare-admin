<?php
defined('BASEPATH') OR exit('No direct script access allowed');

?>

            <div class="content-wrapper">
                <section class="content-header">
                    <?php echo $pagetitle; ?>
                    <?php echo $breadcrumb; ?>
                </section>

                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><?php echo anchor('admin/options', "Options Page"); ?></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_public">
                                        <?php echo $message_public; ?>

                                        <?php echo form_open(current_url(), array('class' => 'form', 'id' => 'form-admin-options')); ?>
                    <?php foreach ($options as $item): ?>

                    <div class="form-group">
                        <label for=""><?php echo $item['title']  ?></label>
                        <input type="text" class="form-control" name="<?php echo $item['name'] ?>" id="<?php echo $item['name'] ?>" value="<?php echo $item['value'] ?>">
                        </div>
                                           
<?php endforeach; ?>
                                            <div class="box-footer">
                                                
                                                    
                                                        <?php echo form_button(array('type' => 'submit', 'class' => 'btn btn-primary btn-flat', 'content' => "Save Options")); ?>
                                                    
                                                
                                            </div>
                                        <?php echo form_close();?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
