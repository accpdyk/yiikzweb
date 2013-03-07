<?php /* @var $this TelbookController*/?>
<div class="content">
    <h3><?php  echo $this->pageTitle;?></h3>
    <?php  $this->renderPartial('_search',array('model'=>$model))?>
    <?php
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            'telname',
            'telphone',
        )
    ))
    ?>
</div>

