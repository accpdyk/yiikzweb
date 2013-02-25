<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property integer $id
 * @property string $username
 * @property string $pwd
 * @property string $partid
 * @property string $rule
 * @property string $email
 * @property string $question
 * @property string $answer
 * @property string $login_ip
 * @property integer $state
 * @property string $phone
 * @property string $name
 * @property string $uptime
 * @property integer $times
 * @property string $ilevel
 * @property string $clocking-in
 * @property string $lastlogintime
 */
class My_User  extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return user the static model class
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
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
            array('username,pwd,name','required'),
            array('username','unique'),
			array('state, times', 'numerical', 'integerOnly'=>true),
			array('username, pwd', 'length', 'max'=>16),
			array('rule', 'length', 'max'=>1),
			array('email, login_ip, phone, name, clocking-in', 'length', 'max'=>50),
			array('question', 'length', 'max'=>255),
			array('uptime, lastlogintime', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, username, pwd, partid, rule, email, question, answer, login_ip, state, phone, name, uptime, times, ilevel, clocking-in, lastlogintime', 'safe', 'on'=>'search'),
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
            'depart'=>array(
                self::BELONGS_TO,
                'My_Department',
                'partid'

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
			'username' => '用户名',
			'pwd' => '密码',
			'partid' => '部门',
			'rule' => '权限',
			'email' => '邮箱',
			'question' => '密码提示问题',
			'answer' => '密码提示问题答案',
			'login_ip' => 'Login Ip',
			'state' => 'State',
			'phone' => '联系电话',
			'name' => '真实姓名',
			'uptime' => 'Uptime',
			'times' => 'Times',
			'ilevel' => '职务',
			'clocking-in' => '考勤状态',
			'lastlogintime' => '上次登录时间',
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

		$criteria->compare('username',$this->username,true);

		$criteria->compare('pwd',$this->pwd,true);

		$criteria->compare('partid',$this->partid);

		$criteria->compare('rule',$this->rule,true);

		$criteria->compare('email',$this->email,true);

		$criteria->compare('question',$this->question,true);

		$criteria->compare('answer',$this->answer,true);

		$criteria->compare('login_ip',$this->login_ip,true);

		$criteria->compare('state',$this->state);

		$criteria->compare('phone',$this->phone,true);

		$criteria->compare('name',$this->name,true);

		$criteria->compare('uptime',$this->uptime,true);

		$criteria->compare('times',$this->times);

		$criteria->compare('ilevel',$this->ilevel,true);



		$criteria->compare('lastlogintime',$this->lastlogintime,true);

		return new CActiveDataProvider('My_User', array(
			'criteria'=>$criteria,
		));
	}
    /*
     *  @return array()
     */
    //得到选项数组
    public  function  getDataList(){
        $data= $this->findAllBySql('select id,name,partid from '.$this->tableName().' order by  partid');
        $option=array();
        if(count($data)){
            foreach($data as $key){
                $option[$key->id]=$key->name;

            }
        }
        return  $option;
    }
}