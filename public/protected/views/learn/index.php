<?php
$this->breadcrumbs=array(
	'Learns',
);

$this->menu=array(
	array('label'=>'Create learn', 'url'=>array('create')),
	array('label'=>'Manage learn', 'url'=>array('admin')),
);
?>

<h1>Learns</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
