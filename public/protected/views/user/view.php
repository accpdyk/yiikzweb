<?php /* @var $this UserController*/?>
<h3><?php echo $this->pageTitle;?><span><a href="<?php echo url('user/info') ?>">[返回]</a></span></h3>
<?php
   $this->widget('zii.widgets.CDetailView',array(
        'data'=>$model,
        'attributes'=>array(
            'name',
            'partid',
            'email',
            'phone',
            'uptime',
            'lastlogintime',
            'ilevel'

        )

   ))
?>