<?php

/**
 * This is the model class for table "My_Department".
 *
 * The followings are the available columns in table 'My_Department':
 */
class My_Department extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return My_Department the static model class
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
		return 'department';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
        return array(
            'notice'=>array(
                self::HAS_MANY,
                'My_Notice',
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
            'type'=>'部门'
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

		return new CActiveDataProvider('My_Department', array(
			'criteria'=>$criteria,
		));
	}
    //得到选项数组
    public  function  getDataList(){
        $data= $this->findAll();
        $option=array(null=>'请选择');
       if(count($data)){
           foreach($data as $key){
              $option[$key->id]=$key->type;
           }
       }
       return  $option;
    }
}