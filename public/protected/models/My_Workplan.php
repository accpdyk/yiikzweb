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
            array('tname,content,title,view_object','required'),
			array('reply_id, departmentid', 'numerical', 'integerOnly'=>true),
			array('content, note_content,title,view_object', 'safe'),
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
			'title' => '标题名称',
            'tname'=>'发布人',
			'content' => '工作计划',
			'time' => '发布时间',
			'note_content' => '批注内容',
			'view_object' => '阅读对象',
			'departmentid' => '部门id',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search($condition='')
	{
		// Warning: Please modify the following code to remove attributes that
		$criteria=new CDbCriteria;
        if($condition == 'note'){
            $criteria->compare('reply_id',$this->id);
        }else{
            $criteria->compare('reply_id',0,false);//不显示批注
            $criteria->compare('title',$this->title);
            $criteria->compare('tname',user()->getName(),false);//查询当前用户发布的
            $criteria->compare('view_object',user()->getName(),true,'or');  //模糊查询 阅读对象 用户
            $depart = My_Department::model()->findByPk(user()->getState('department'))->type;
            $criteria->compare('view_object',$depart,true,'or');//模糊查询 阅读对象 部门
            $criteria->compare('departmentid',$this->departmentid);
        }
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}