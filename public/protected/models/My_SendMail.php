<?php

/**
 * This is the model class for table "send_mail".
 *
 * The followings are the available columns in table 'send_mail':
 * @property string $id
 * @property string $addressee
 * @property string $copy
 * @property string $title
 * @property string $time
 * @property string $content
 * @property string $addressor
 */
class My_SendMail extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return My_SendMail the static model class
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
		return 'send_mail';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('addressee, copy, title, addressor', 'length', 'max'=>200),
			array('time, content', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, addressee, copy, title, time, content, addressor', 'safe', 'on'=>'search'),
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
			'addressee' => 'Addressee',
			'copy' => 'Copy',
			'title' => 'Title',
			'time' => 'Time',
			'content' => 'Content',
			'addressor' => 'Addressor',
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

		$criteria->compare('id',$this->id,true);
		$criteria->compare('addressee',$this->addressee,true);
		$criteria->compare('copy',$this->copy,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('time',$this->time,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('addressor',$this->addressor,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}