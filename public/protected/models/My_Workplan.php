<?php

/**
 * This is the model class for table "workplan".
 *
 * The followings are the available columns in table 'workplan':
 * @property integer $id
 * @property integer $reply_id
 * @property string $type
 * @property string $title
 * @property string $content
 * @property string $time
 * @property string $note_content
 * @property string $view_object
 * @property integer $departmentid
 */
class My_Workplan extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return My_Workplan the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'workplan';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('reply_id, departmentid', 'numerical', 'integerOnly'=>true),
			array('type, time, view_object', 'length', 'max'=>50),
			array('title', 'length', 'max'=>255),
			array('content, note_content', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, reply_id, type, title, content, time, note_content, view_object, departmentid', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'reply_id' => 'Reply',
			'type' => 'Type',
			'title' => 'Title',
			'content' => 'Content',
			'time' => 'Time',
			'note_content' => 'Note Content',
			'view_object' => 'View Object',
			'departmentid' => 'Departmentid',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('reply_id',$this->reply_id);
		$criteria->compare('type',$this->type,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('time',$this->time,true);
		$criteria->compare('note_content',$this->note_content,true);
		$criteria->compare('view_object',$this->view_object,true);
		$criteria->compare('departmentid',$this->departmentid);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}