<?php

/**
 * This is the model class for table "learn".
 *
 * The followings are the available columns in table 'learn':
 * @property integer $id
 * @property integer $reply_id
 * @property string $type
 * @property string $title
 * @property string $content
 * @property string $time
 * @property string $note_content
 * @property string $writer_name
 * @property string $writer_part
 * @property integer $grade
 * @property string $sendalso
 * @property string $usersendalso
 */
class learn extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return learn the static model class
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
		return 'learn';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('reply_id, grade', 'numerical', 'integerOnly'=>true),
			array('type, time, writer_name, writer_part', 'length', 'max'=>50),
			array('title, sendalso, usersendalso', 'length', 'max'=>255),
			array('content, note_content', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, reply_id, type, title, content, time, note_content, writer_name, writer_part, grade, sendalso, usersendalso', 'safe', 'on'=>'search'),
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
			'id' => 'Id',
			'reply_id' => 'Reply',
			'type' => 'Type',
			'title' => 'Title',
			'content' => 'Content',
			'time' => 'Time',
			'note_content' => 'Note Content',
			'writer_name' => 'Writer Name',
			'writer_part' => 'Writer Part',
			'grade' => 'Grade',
			'sendalso' => 'Sendalso',
			'usersendalso' => 'Usersendalso',
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

		$criteria->compare('writer_name',$this->writer_name,true);

		$criteria->compare('writer_part',$this->writer_part,true);

		$criteria->compare('grade',$this->grade);

		$criteria->compare('sendalso',$this->sendalso,true);

		$criteria->compare('usersendalso',$this->usersendalso,true);

		return new CActiveDataProvider('learn', array(
			'criteria'=>$criteria,
		));
	}
}