<?php
$this->breadcrumbs=array(
	'Learns'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List learn', 'url'=>array('index')),
	array('label'=>'Create learn', 'url'=>array('create')),
	array('label'=>'Update learn', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete learn', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage learn', 'url'=>array('admin')),
);
?>

<h1>View learn #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'reply_id',
		'type',
		'title',
		'content',
		'time',
		'note_content',
		'writer_name',
		'writer_part',
		'grade',
		'sendalso',
		'usersendalso',
	),
)); ?>
