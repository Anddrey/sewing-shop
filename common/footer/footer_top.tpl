<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
  <div class="container">
    <div class="inside space-padding-tb-50">
      <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 column">
          <?php
          if($content=$helper->getLangConfig('widget_social')){
          echo $content;
          }
          ?>
        </div>

        <?php if ($informations) { ?>
        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 column">
          <div class="panel">
            <div class="panel-heading"><h5 class="panel-title"><?php echo $text_information; ?></h5></div>
            <div class="panel-body">
              <ul class="list-unstyled">
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
          </div>
        </div>
        <?php } ?>
        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 column">
          <div class="panel">
            <div class="panel-heading"><h5 class="panel-title"><?php echo $text_extra; ?></h5></div>
            <div class="panel-body">
              <ul class="list-unstyled">
                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
              </ul>
            </div>
          </div>
        </div>
        
          <div class="column col-xs-12 col-sm-3 col-lg-3 col-md-3">
        <div class="box">
          <div class="box-heading"><span><?php echo $text_account; ?></span></div>
          <div class="box-content">
            <ul class="list bullet text-fill">              
              <li><a href="<?php echo $account; ?>" data-hover="<?php echo $text_account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $order; ?>" data-hover="<?php echo $text_order; ?>"><?php echo $text_order; ?></a></li>
              <li><a href="<?php echo $wishlist; ?>" data-hover="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
              <li><a href="<?php echo $newsletter; ?>" data-hover="<?php echo $text_newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            </ul>
          </div>
        </div>
      </div>

      </div>
    </div>
  </div>
</div>


