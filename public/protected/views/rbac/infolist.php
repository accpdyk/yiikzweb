<?php  /* @var $this RbacController*/ ?>
<?php

    $this->widget('CTabView',array(
            'htmlOptions'=>array('style'=>'width:600px;'),
            'tabs'=>array(
                'tab1'=>array(
                    'title'=>'用户角色',
                    'content'=>'http://www.yiiframework.com/',

                ),
                'tab3'=>array(
                    'title'=>'用户任务',
                    'content'=>'http://www.yiiframework.com/',
                ),
                'tab2'=>array(
                    'title'=>'用户操作',
                    'content'=>'http://www.yiiframework.com/',
                ),
            )

        )


    )
?>