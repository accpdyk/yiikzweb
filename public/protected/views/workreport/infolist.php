<?php      /* @var $this WorkreportController*/ ?>
<div class="content">
    <h3><?php echo $this->pageTitle;?></h3>
    <?php
    $this->widget('My_TabView',array(
        'activeTab'=>$this->showTab(),

        'tabs'=>array(
            'tab1'=>array(
                'title'=>"用户提交报告",
                'url'=>url('workreport/info',array('type'=>'self')),
                'view'=>$tab,
                'data'=>array('data'=>$data)

            ),
            'tab2'=>array(
                'title'=>'本部门其他人员报告',
                'url'=>url('workreport/info',array('type'=>'department')),
                'view'=>$tab,
                'data'=>array('data'=>$data)

            ),
            'tab3'=>array(
                'title'=>'其他部门报告',
                'url'=>url('workreport/info',array('type'=>'all')),
                'view'=>$tab,
                'data'=>array('data'=>$data)
            )

        ),
    ))
    ?>


</div>