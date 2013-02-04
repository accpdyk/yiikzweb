<?php
$this->breadcrumbs=array(
	'Learns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List learn', 'url'=>array('index')),
	array('label'=>'Manage learn', 'url'=>array('admin')),
);
?>

<h1>Create learn</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>