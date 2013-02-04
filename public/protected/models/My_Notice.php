<?php

/**
 * This is the model class for table "notice".
 *
 * The followings are the available columns in table 'notice':
 * @property integer $id
 * @property string $username
 * @property string $tname
 * @property string $partid
 * @property string $title
 * @property string $ttext
 * @property string $html
 * @property string $type
 * @property string $time
 * @property string $IP
 * @property string $fjname
 * @property string $view_object
 */
class My_Notice extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return notice the static model class
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
		return 'notice';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
            array('tname,title,ttext,partid','required'),
			array('username,view_object', 'length', 'max'=>50),
			array('tname, partid', 'length', 'max'=>16),
			array('ttext', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('tname, partid, type, title', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
           'depart'=>array(
               self::BELONGS_TO,
               'My_Department',
               'partid',


           )
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'username' => 'Username',
			'tname' => '发布人',
			'partid' => '部门',
			'title' => '通知标题',
			'ttext' => '内容',
			'html' => 'Html',
			'time' => '发布时间',
			'IP' => 'Ip',
			'fjname' => 'Fjname',
			'view_object' => 'View Object',
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

		$criteria->compare('tname',$this->tname,true);

		$criteria->compare('partid',$this->partid);

		$criteria->compare('title',$this->title,true);

		$criteria->compare('time',$this->time,true);

        $criteria->with='depart';
       // $criteria->join='left outer join  department on  department.id = partid';
		return new CActiveDataProvider('My_Notice', array(
			'criteria'=>$criteria,
            'pagination'=>array(
                'pageSize'=>10,
            ),

		));
	}
}