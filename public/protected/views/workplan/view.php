<?php /*  @var $this WorkplanController*/?>
<div class="content">
    <h3><?php  echo $this->pageTitle;?> <span><a href="<?php echo url('workplan/info') ?>">[返回]</a></span></h3>
    <?php $this->widget('zii.widgets.CDetailView', array(
    'data'=>$model,
    'attributes'=>array(
        'tname',
        'title',
        'content:html',//组合查询出的type
        'time',
    ),
)); ?>
   <div style="border-bottom: 1px  solid#2e8b57;width: 100%; padding: 1em; font-size: 14px; font-weight: bold; ">批注</div>
  <?php
     $this->widget('zii.widgets.grid.CGridView',array(
         'dataProvider'=>$model->search('note'),
         'columns'=>array(
             array('name'=>'tname','value'=>'$data->tname','header'=>'批注人员姓名','headerHtmlOptions'=>array('style'=>'width:30%')),
             'note_content'
         ),
         'emptyText'=>'暂无数据'


     ))

  ?>
    <div>
        <P>增加批注:</P>
         <?php  echo CHtml::beginForm('','post')?>
        <div style="padding: 1em;">
            <?php  echo CHtml::textArea('note_content','',array('style'=>'width:600px'))?>
            <?php  echo CHtml::hiddenField('id',$_GET['id']);?>
        </div>
        <div><?php echo CHtml::submitButton('增加')?></div>
        <?php  echo CHtml::endForm();?>
    </div>
</div>