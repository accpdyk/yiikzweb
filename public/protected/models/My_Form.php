<?php
/**
 ****************************
 * FileName:  My_Form.php.
 * User:  hongke
 * Date:  13-1-25
 * Time:  下午3:46
 * **************************
 */
class My_Form extends  CFormModel
{
    public $username;
    public $password;
    public $capCode;
    private $_identity;
    public function rules() {
        return array(
            array('username, password', 'required','message'=>'必须填写'),
            array('password','authenticate'),
        );
    }
    //属性
    public function attributeLabels()
    {
        return array(
            'username'=>'用户名',
            'password'=>'密码',
        );
    }

    //密码验证
    public function authenticate($attrbuties,$params){
        if(!$this->hasErrors())
        {
            $this->_identity=new UserIdentity($this->username,$this->password);
            switch($this->_identity->authenticate()){
                case 1:
                    $this->addError('username','无此用户名');break;
                case 2:
                    $this->addError('password','密码错误');break;
                case 100:
                    $this->addError('username','用户名未通过审核');break;
                default:break;
            }
        }
    }
    public function login(){
        if($this->_identity->errorCode === UserIdentity::ERROR_NONE){
            $duration = 3600*24;//设置cookie有效时间
            user()->login($this->_identity,$duration);
          //  user()->setName($this->username);
            return true;
        }

    }

}
