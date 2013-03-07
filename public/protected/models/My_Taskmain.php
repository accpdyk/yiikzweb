<?php

/**
 * This is the model class for table "taskmain".
 *
 * The followings are the available columns in table 'taskmain':
 * @property integer $tid
 * @property integer $tuid
 * @property integer $uid
 * @property string $starttime
 * @property string $title
 * @property string $content
 * @property string $level
 * @property integer $finished
 * @property string $finishedtime
 * @property string $remark
 */
class My_Taskmain extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return My_Taskmain the static model class
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
		return 'taskmain';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('uid', 'required','message'=>"请选择任务指定者"),
			array('tuid, uid, finished', 'numerical', 'integerOnly'=>true),
			array('starttime, finishedtime,level', 'length', 'max'=>50),
			array('content, remark,title', 'safe'),
			array('tid, tuid, uid, starttime, title, content, level, finished, finishedtime, remark', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
            'users'=>array(
                self::BELONGS_TO,
                'My_User',
                array('tuid'=>'id'),
                'select'=>'name'
            )
        );
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'tid' => 'Tid',
			'tuid' => 'Tuid',
			'uid' => 'Uid',
			'starttime' => '发布时间',
			'title' => '标题',
			'content' => '内容',
			'level' => '紧急程度',
			'finished' => '是否完成',
			'finishedtime' => '完成时间',
			'remark' => '备注',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		$criteria=new CDbCriteria;
		$criteria->compare('uid',user()->getId());//查询的是自己接受的任务
        $criteria->compare('title',$this->title,true);
        $criteria->compare('tuid',$this->tuid);
        if($this->finished!='all')     $criteria->compare('finished',$this->finished);
         $criteria->with = 'users';
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
    //标记已完成
    public  function updateFinished($tid){
        Yii::app()->db->createCommand()->update(
            $this->tableName(),
            array('finished'=>'y','finishedtime'=>date('Y-m-d H:i:s')),
            array('and','tid=:id'),
            array(':id'=>$tid)
        );
    }
}