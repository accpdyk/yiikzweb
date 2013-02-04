<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
    public  $department;
    public  function authenticate(){
        $users = My_User::model()->find('username=:uname',array(':uname'=>$this->username));
        if($users===null){
            $this->errorCode=  self::ERROR_USERNAME_INVALID;
        } else if($users->pwd!==$this->password){
            $this->errorCode = self::ERROR_PASSWORD_INVALID;
        }else if($users->state){
            $this->errorCode = self::ERROR_UNKNOWN_IDENTITY;
        }else{
            $this->errorCode = self::ERROR_NONE;
            $this->assignInfo($users->name,$users->id,$users->partid);
        }
        return  $this->errorCode;
    }
    /*
     * 赋值用户的ID和name,用于在CUserIdentity中的getName()和getId()的使用
     */
    function  assignInfo($name,$id,$pid){
      $this->username = $name ;
      $this->userid   = $id;
      $this->department = $pid;
    }
}