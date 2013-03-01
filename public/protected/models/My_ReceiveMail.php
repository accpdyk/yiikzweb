<?php

/**
 * This is the model class for table "receive_mail".
 *
 * The followings are the available columns in table 'receive_mail':
 * @property string $id
 * @property string $addressee
 * @property string $send_mail_id
 * @property string $iscopy
 * @property string $isread
 */
class My_ReceiveMail extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return My_ReceiveMail the static model class
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
		return 'receive_mail';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('send_mail_id', 'required'),
			array('addressee', 'length', 'max'=>200),
			array('send_mail_id', 'length', 'max'=>20),
			array('iscopy, isread', 'length', 'max'=>1),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, addressee, send_mail_id, iscopy, isread', 'safe', 'on'=>'search'),
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
			'send_mail_id' => 'Send Mail',
			'iscopy' => 'Iscopy',
			'isread' => 'Isread',
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
		$criteria->compare('send_mail_id',$this->send_mail_id,true);
		$criteria->compare('iscopy',$this->iscopy,true);
		$criteria->compare('isread',$this->isread,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}