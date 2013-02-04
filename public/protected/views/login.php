<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="aa/border.css" type="text/css" rel="stylesheet">
</head>
<body leftmargin="0" topmargin="3" background="<?php echo request()->baseUrl;?>/static/images/dw.gif"  marginheight="0" marginwidth="0" text="#000000">
<link href="<?php echo request()->baseUrl;?>/static/login.css" rel="stylesheet" type="text/css">
<?php /* @var  $this WelcomeController */  ?>
<?php  $form=$this->beginWidget('CActiveForm',array(
       'id'=>'loginForm',
       'enableClientValidation'=>true,

))
?>
<table id="mytable" border="0" cellpadding="1" cellspacing="0" height="100%" width="100%">
    <tbody>
    <tr background="<?php echo request()->baseUrl;?>/static/images/fang.gif">
        <td background="<?php echo request()->baseUrl;?>/static/images/fang.gif" height="10"></td></tr>
    <tr>
        <td align="center" height="*" valign="center">
            <table align="center" border="0" cellpadding="1" cellspacing="0" height="410" width="650">
                <tbody>
                <tr>
                    <td bgcolor="#999999" height="410" valign="top" width="520">
                        <table border="0" cellpadding="0" cellspacing="0" width="520">
                            <tbody>
                            <tr>
                                <td><img src="<?php echo request()->baseUrl;?>/static/images/22.jpg" height="410" width="520"></td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                    <td bgcolor="#999999" height="410" valign="top" width="*">
                        <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                            <tbody>
                            <tr>
                                <td bordercolor="#ffffff" height="410">
                                        <table border="0" cellpadding="5" cellspacing="0" width="138">
                                            <tbody>
                                            <tr>
                                                <td style="FONT-SIZE: 9pt" height="32">
                                                    <?php  echo $form->labelEx($model,'username');?>
                                                    <?php  echo $form->textField($model,'username',array('class'=>'frmtxt'));?>
                                                    <?php  echo $form->error($model,'username');?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="FONT-SIZE: 9pt">
                                                    <?php  echo $form->labelEx($model,'password');?>
                                                    <?php  echo $form->passwordField($model,'password',array('class'=>'frmtxt'));?>
                                                    <?php  echo $form->error($model,'password');?>
                                                </td></tr>
                                            <tr>
                                                <td height="23">
                                                    <div align="center"><?php  echo CHtml::submitButton('登陆')?> </div></td></tr>
                                            <tr>
                                                <td height="21">
                                                    <div align="center"><a href="<?php echo  url('login/register')?>" >申请帐号</a></div></td></tr>
                                            <tr>
                                                <td height="18">
                                                    <div align="center"><a href="#" onClick="MM_openBrWindow('forgetpass.asp','','width=500,height=280')">忘记密码</a></div></td></tr></tbody></table>
                                    <p>&nbsp;</p></td></tr>
                            </tbody>
                        </table></td></tr>
                </tbody></table>

        </td></tr>


    <tr background="<?php echo request()->baseUrl;?>/static/images/fang.gif">
        <td background="<?php echo request()->baseUrl;?>/static/images/fang.gif" height="10"></td>
    </tr>
    </tbody>
</table>
<?php  $this->endWidget();?>
</body>
</html>
