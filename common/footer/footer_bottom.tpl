<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
  <div class="container">
    <div class="inside">
      <div class="row">
       <div class="hidden-sm hidden-xs col-md-3 col-lg-3 column">
          <?php
          if($content=$helper->getLangConfig('widget_logo')){
          echo $content;
          }
          ?>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 column">
        

           <?php
              echo $helper->renderModule('pavnewsletter');
            ?>

            <div class="cleafix space-margin-tb-30 widget-block">
                 <?php
              if($content=$helper->getLangConfig('widget_papal')){
              echo $content;
              }
              ?>

              <?php
              if($content=$helper->getLangConfig('widget_callus')){
              echo $content;
              }
              ?>
            </div>
       

        </div>   
      </div>
    </div>
  </div>
</div>


