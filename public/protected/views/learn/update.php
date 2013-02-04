<?php
$this->breadcrumbs=array(
	'Learns'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List learn', 'url'=>array('index')),
	array('label'=>'Create learn', 'url'=>array('create')),
	array('label'=>'View learn', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage learn', 'url'=>array('admin')),
);
?>

<h1>Update learn <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>