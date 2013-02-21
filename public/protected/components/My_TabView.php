<?php
/**
 ****************************
 * FileName:  My_TabView.php.
 * User:  hongke
 * Date:  13-2-21
 * Time:  上午11:15
 * **************************
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
                  if(isset($tab['content']))
                      echo $tab['content'];
                  else if(isset($tab['view']))
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
