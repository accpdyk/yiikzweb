<div class="content">
    <h3><?php  echo $this->pageTitle;?> <span><a href="<?php echo url('car/info') ?>">[返回]</a></span></h3>
    <?php $this->widget('zii.widgets.CDetailView', array(
    'data'=>$model,
    'attributes'=>array(
        'car_code',
        'car_type',
        'car_buytime',
        'car_buyprice',
        'car_company',
        'car_user',
        'car_usermobile',
        'car_usertel',
        'car_money:html',
        'car_fixlog',
        'time',
        'ip',
        'car_state',
        'car_statestart',
        'car_stateend',
        'car_statesmalluser',
        'car_statecompany',
        'car_statebiguser',
        'car_statecause',
        'car_statedeparture' ,
        'car_statedestination',
    ),
)); ?>
</div>
