<?php

/**
 * This is the model class for table "workreport".
 *
 * The followings are the available columns in table 'workreport':
 * @property integer $id
 * @property string $username
 * @property string $tname
 * @property int $department
 * @property string $title
 * @property string $ttext
 * @property string $time
 * @property string $IP
 * @property string $fjname
 * @property string $view_object
 * @property string $lastmodifydate
 */
class My_Workreport extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return workreport the static model class
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
		return 'workreport';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
            array('tname,ttext,title,department','required'),
			array('title', 'length', 'max'=>255),
			array('time', 'length', 'max'=>200),
			array('ttext,userid', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, username, tname, department, title, ttext,  time,  view_object, lastmodifydate', 'safe', 'on'=>'search'),
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
                'My_department',
                array('department'=>'id'),
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
			'tname' => '汇报人员',
			'department' => '部门',
			'title' => '标题',
			'ttext' => '汇报内容',
			'time' => '提交时间',
			'view_object' => 'View Object',
			'lastmodifydate' => '上次修改时间',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search($condition='')
	{
	$criteria=new CDbCriteria;
       $criteria->condition = 'department';
       $criteria->with = 'depart';
        switch($condition){
            case 'department'://本部门
                $criteria->compare('department',user()->getState('department'));//查询登录用户所在部门发布的报告
                $criteria->compare('userid',user()->getId(),false,'<>');
                break;
            case 'other'://其他部门
                $criteria->condition = 'department <> '.user()->getState('department');
                break;
            case 'all'://查看所有
                break;
            case 'self'://当前用户
            default:
                $criteria->compare('userid',user()->getId());//查询登录用户发布的报告
                break;
        }
       // $criteria->compare('tname',$this->tname);
		//$criteria->compare('title',$this->title,true);
		return new CActiveDataProvider('My_Workreport', array(
			'criteria'=>$criteria,

		));
	}
}