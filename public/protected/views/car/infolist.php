<div class="content">
    <h3><?php  echo $this->pageTitle;?></h3>
    <style type="text/css">
        .operation{ text-decoration: none; margin: 1em;}
    </style>
    <?php /* @var $this NoticeController*/
    $this->renderPartial('_search',array('model'=>$model));
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            array(
                'class'=>'CCheckBoxColumn',
                'header'=>'选择',
                'value'=>'$data->id',
                'htmlOptions'=>array('class'=>'chkboxRow'),
                'checkBoxHtmlOptions'=>array('class'=>'chkbox'),
                'selectableRows'=>2
            ),
            array('name'=>'id','value'=>'$row+1'),
            'car_code','car_type','car_user','car_usermobile','car_state',
            array('name'=>'使用时间','value'=>'$data->car_statestart.\'--\'.$data->car_stateend'),
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{update}{delete}{view}{set}',
                'buttons'=>array(
                    'update'=>array('label'=>'修改','url'=>'url(\'car/edit\',array(\'id\'=>$data->id))','imageUrl'=>false, 'options'=>array('style'=>"margin: 1em")),
                    'delete'=>array('label'=>"删除",'imageUrl'=>false,'options'=>array('style'=>"margin: 1em"),'visible'=>'user()->checkAccess(\'admin\')?true:false'),
                     'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                     'set'=>array('label'=>"设置",'url'=>'url(\'car/state\',array(\'id\'=>$data->id))','options'=>array('style'=>'margin:1em'))
                )
            ),
        ),

    ))
    ?>
    <?php  echo CHtml::htmlButton('全选',array('onclick'=>'selectAll()'))?>
    <?php  echo CHtml::htmlButton('反选',array('onclick'=>'resetAll()'))?>
    <?php  echo CHtml::htmlButton('删除',array('onclick'=>'delSelect()'))?>
</div>
<script type="text/javascript">
    function selectAll(){
         $('.chkboxRow :checkbox').attr('checked',true);
    }
    function resetAll(){
         $('.chkboxRow :checkbox').attr('checked',false);
    }
    function delSelect(){
        var  num =  $(".chkbox:checked").length;   //选中个数（所有checkbox的class均为.chkbox）
        var  data =  new Array(); //声明数组
        if(num){
            $('.chkbox:checked').each(function(){
                data.push($(this).val());   //循环插入数组数据

            })
            if(confirm('确定要删除以下多条数据？'+data)){
                $.ajax({
                    url:'<?php  echo url('car/delSelect')?>',
                    data:({aid:data.join()}), //data.join是合并成一个字符串，否则提交的将是数组
                    success:function(){
                     //   window.location.reload();  //成功后，刷新页面
                    }
                })
            }
        }
    }
</script>


