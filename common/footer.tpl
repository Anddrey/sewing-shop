<?php 
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
  $config = $this->registry->get('config'); 
  $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('config_template') );
  $helper->loadFooterModules();
  $layoutID = 1 ;
  $objlang = $this->registry->get('language'); 
?>
 
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
 
  $ospans = array();
  $tmcols = 'col-sm-12 col-xs-12';
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php } ?>
 
<footer id="footer">

    <?php

    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array(1=>12,2=>3,3=>3,4=>3,5=>3);
   
      require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );

      if( count($modules) <=0 ){
          require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_top.tpl' ) );
      }
  ?>
  
  <?php

    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array(1=>9);
    $tmcols = 'col-lg-offset-3 col-md-offset-3 ';
   
      require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );

      if( count($modules) <=0 ){
          require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_center.tpl' ) );
      }
  ?>



  <?php

    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array(1=>3,2=>9);
   
      require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );

      if( count($modules) <=0 ){
          require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_bottom.tpl' ) );
      }
  ?>



</footer>
 
 
<div id="powered">
  <div class="container"><div class="inside">
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12 space-padding-tb-40">
        <div class="copyright pull-left">
        <?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
          <?php echo html_entity_decode($helper->getConfig('copyright')); ?>
        <?php } else { ?>
          <?php echo $powered; ?>. 
        <?php } ?>
        </div> 
        <ul class="links pull-right">
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
        </ul>         
      </div>
    </div>
  </div></div>

</div>
<div id="top"><a class="scrollup" href="#"><i class="fa fa-angle-up"></i><?php echo $objlang->get("Top");?></a></div>


<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>

</div>
<?php
  $offcanvas = $helper->getConfig('offcanvas','category');
  if($offcanvas == "megamenu") {
      echo $helper->renderAddon( 'offcanvas');
  } else {
      echo $helper->renderAddon( 'offcanvas-category');
  }

  ?> 
</body></html>