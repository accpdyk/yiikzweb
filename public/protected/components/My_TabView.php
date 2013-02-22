<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 13-2-21
 * Time: 下午8:39
 * To change this template use File | Settings | File Templates.
 */
class My_TabView extends  CTabView
{
    //改成只渲染显示tab的内容
    protected   function renderBody(){
        foreach($this->tabs as $id=>$tab)
        {
            if($id==$this->activeTab){
                $inactive= '';
                echo "<div class=\"view\" id=\"{$id}\"{$inactive}>\n";
                if($this->activeTab=='tab3'){ //tab3是查看其他部门权限
                    if(!user()->checkAccess('pro_edit'))
                        echo '抱歉，您没有权限查看其他部门,请联系管理员!';
                    else{
                        if(isset($tab['data']))
                        {
                            if(is_array($this->viewData))
                                $data=array_merge($this->viewData, $tab['data']);
                            else
                                $data=$tab['data'];
                        }
                        else
                            $data=$this->viewData;
                        $this->getController()->renderPartial($tab['view'], $data);
                    }


                }else  if(isset($tab['view']))
                {
                    if(isset($tab['data']))
                    {
                        if(is_array($this->viewData))
                            $data=array_merge($this->viewData, $tab['data']);
                        else
                            $data=$tab['data'];
                    }
                    else
                        $data=$this->viewData;
                    $this->getController()->renderPartial($tab['view'], $data);
                }
                echo "</div><!-- {$id} -->\n";
            }
        }
    }


}
