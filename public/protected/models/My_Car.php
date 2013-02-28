<?php

/**
 * This is the model class for table "car".
 *
 * The followings are the available columns in table 'car':
 * @property integer $id
 * @property string $car_code
 * @property string $car_type
 * @property string $car_buytime
 * @property string $car_buyprice
 * @property string $car_company
 * @property string $car_user
 * @property string $car_usermobile
 * @property string $car_usertel
 * @property string $car_money
 * @property string $car_fixlog
 * @property string $time
 * @property string $ip
 * @property string $car_state
 * @property string $car_statestart
 * @property string $car_stateend
 * @property string $car_statesmalluser
 * @property string $car_statecompany
 * @property string $car_statebiguser
 * @property string $car_statecause
 * @property string $car_statedeparture
 * @property string $car_statedestination
 */
class My_Car extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return My_Car the static model class
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
		return 'car';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
            array('car_code,car_type,car_buytime,car_user,car_usermobile','required'),
			array('car_code, car_type', 'length', 'max'=>16),
			array('car_buytime', 'length', 'max'=>24),
			array('car_buyprice, car_company, car_user, car_usermobile, car_usertel, time, ip, car_state, car_statesmalluser, car_statecompany, car_statebiguser', 'length', 'max'=>50),
			array('car_detail, car_statecause, car_statedeparture, car_statedestination', 'length', 'max'=>255),
			array('car_money, car_fixlog, car_statestart, car_stateend', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, car_code, car_type, car_buytime, car_buyprice, car_detail, car_company, car_user, car_usermobile, car_usertel, car_money, car_fixlog, time, ip, car_state, car_statestart, car_stateend, car_statesmalluser, car_statecompany, car_statebiguser, car_statecause, car_statedeparture, car_statedestination', 'safe', 'on'=>'search'),
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
			'car_code' => '车牌号',
			'car_type' => '车辆类型',
			'car_buytime' => '购买时间',
			'car_buyprice' => '购买价格',
			'car_company' => '所属部门',
			'car_user' => '所属司机',
			'car_usermobile' => '司机手机',
			'car_usertel' => '司机电话',
			'car_money' => '运营费用',
			'car_fixlog' => '修理记录',
			'time' => '录入时间',
			'ip' => 'Ip',
			'car_state' => '目前状态',
			'car_statestart' => '起始时间',
			'car_stateend' => '结束时间',
			'car_statesmalluser' => '使用人员',
			'car_statecompany' => '使用部门',
			'car_statebiguser' => '操作人员',
			'car_statecause' => '使用原因',
			'car_statedeparture' => '起始地',
			'car_statedestination' => '目的地',
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
		$criteria->compare('car_code',$this->car_code,true);
		$criteria->compare('car_type',$this->car_type,true);
		$criteria->compare('car_buytime',$this->car_buytime,true);
		$criteria->compare('car_buyprice',$this->car_buyprice,true);
		$criteria->compare('car_company',$this->car_company,true);
		$criteria->compare('car_user',$this->car_user);
		$criteria->compare('car_usermobile',$this->car_usermobile,true);
		$criteria->compare('car_usertel',$this->car_usertel,true);
		$criteria->compare('car_money',$this->car_money,true);
		$criteria->compare('car_fixlog',$this->car_fixlog,true);
		$criteria->compare('time',$this->time,true);
		$criteria->compare('ip',$this->ip,true);
		$criteria->compare('car_state',$this->car_state,true);
		$criteria->compare('car_statestart',$this->car_statestart,true);
		$criteria->compare('car_stateend',$this->car_stateend,true);
		$criteria->compare('car_statesmalluser',$this->car_statesmalluser,true);
		$criteria->compare('car_statecompany',$this->car_statecompany,true);
		$criteria->compare('car_statebiguser',$this->car_statebiguser,true);
		$criteria->compare('car_statecause',$this->car_statecause,true);
		$criteria->compare('car_statedeparture',$this->car_statedeparture,true);
		$criteria->compare('car_statedestination',$this->car_statedestination,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}