<?php      /* @var $this WorkreportController*/ ?>
<div class="content">
    <h3><?php echo $this->pageTitle;?></h3>
    <?php
    $this->renderPartial('_search',array('model'=>$model,'data'=>$this->getDepartmentList()))?>
    <?php
    $this->widget('CTabView',array(
        'tabs'=>array(
            'tab1'=>array(
                'title'=>"提交报告",
                'view'=>'_tab',
               'data'=>array('data'=>$model->search('self'))

            ),
            'tab2'=>array(
                'title'=>'本部门人员报告',
                'view'=>'_tab',
                'data'=>array('data'=>$model->search('department'))
            ),
            'tab3'=>array(
                'title'=>'其他部门报告',
                'view'=>'_tab',
                'data'=>array('data'=>$model->search('all'))
            )

        ),
        'viewData'=>array('model'=>$model)
    ))
    ?>


</div>