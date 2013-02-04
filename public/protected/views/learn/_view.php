<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('reply_id')); ?>:</b>
	<?php echo CHtml::encode($data->reply_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('type')); ?>:</b>
	<?php echo CHtml::encode($data->type); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('title')); ?>:</b>
	<?php echo CHtml::encode($data->title); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('content')); ?>:</b>
	<?php echo CHtml::encode($data->content); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('time')); ?>:</b>
	<?php echo CHtml::encode($data->time); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('note_content')); ?>:</b>
	<?php echo CHtml::encode($data->note_content); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('writer_name')); ?>:</b>
	<?php echo CHtml::encode($data->writer_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('writer_part')); ?>:</b>
	<?php echo CHtml::encode($data->writer_part); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('grade')); ?>:</b>
	<?php echo CHtml::encode($data->grade); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sendalso')); ?>:</b>
	<?php echo CHtml::encode($data->sendalso); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usersendalso')); ?>:</b>
	<?php echo CHtml::encode($data->usersendalso); ?>
	<br />

	*/ ?>

</div>