<div style="clear:both;font-family: '微软雅黑'; font-size: 24px;  border: solid;">
    <h1 align="center">kz办公系统</h1>
    <div style="text-indent: 2em;">
        <ul>
            <li>你好，<?php   echo user()->getName()?></li>
            <li>您有<?php echo  CHtml::link($mail,array('task/doing'));?>项未完成任务</li>
            <li>您有<?php echo   CHtml::link($task,array('mail/inbox'));?>封未读邮件</li>
        </ul>
    </div>
</div>

