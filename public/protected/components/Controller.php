<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/main';
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	public $breadcrumbs=array();
    /**
     * 搜索模板
     * @var SearchForm
     */
    public $searchFormModel;

  /*  public function filters()
    {
        return array(
            'accessControl', //必须加上这个函数，要不然下面的rules就没法引用，也就不起作用了
        );
    }

    public  function accessRules(){
        return array(
            array(
                'allow',
                'users'=>array('@'),
                'message'=>'无权限访问'
            ),
            array(
                'deny',
                'users'=>array('*'),
            )
        );
    }*/
    //部门键值数组列表
    public  function  getDepartmentList(){

       return  My_Department::model()->getDataList();

    }

}