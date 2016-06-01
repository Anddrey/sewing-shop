<?php
  $this->language( 'module/themecontrol' );
  $objlang = $this->registry->get('language');
  $megamenu = $helper->renderModule('pavmegamenu');
  $autosearch = $helper->renderModule('pavautosearch');
  $verticalmenu = $helper->renderModule('pavverticalmenu');
  if( isset($_COOKIE[$themeName .'_skin']) && $_COOKIE[$themeName .'_skin'] ){
    $skin = trim($_COOKIE[$themeName .'_skin']);
  }
?>

<header id="header-layout"  class="header-v1">

<nav id="topbar">
  <div class="container">
    <div class="topbar-left">
       <div class="quick-setting pull-left hidden-lg hidden-md hidden-sm">
          <div class="quickaccess-toggle">
            <span><?php echo $objlang->get('text_setting');?></span><i class="fa fa-angle-down"></i>
            <div class="inner-toggle">
              <ul class="">
                <li><a class="" href="<?php echo $account; ?>"><span class="fa fa-user"></span><?php echo $text_account; ?></a></li>
                <li><a class="shoppingcart" href="<?php echo $shopping_cart; ?>"><span class="fa fa-shopping-cart"></span><?php echo $text_shopping_cart; ?></a></li>
                <li><a class="last" href="<?php echo $checkout; ?>"><span class="fa fa-file"></span><?php echo $text_checkout; ?></a></li> 
                <?php if ($logged) { ?>
                    <li><a href="<?php echo $logout; ?>"><span class="fa fa-unlock"></span><?php echo $text_logout; ?></a></li>
                   <?php } else { ?>
                    <li><a href="<?php echo $register; ?>"><span class="fa fa-pencil"></span><?php echo $text_register; ?></a></li>
                    <li><a href="<?php echo $login; ?>"><span class="fa fa-unlock"></span><?php echo $text_login; ?></a> </li>
                  <?php } ?>
              </ul>
            </div>
          </div>
        </div>  

      <div class="login pull-left hidden-xs">
        <ul class="links">
          <li><a class="" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a class="wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
          <?php if ($logged) { ?>
            <li>  <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li>  <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li>  <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>  </li>
            <?php } ?>
        </ul>
      </div>
    <div class="pull-left">
      <div class="quick-user pull-left">
      <?php echo $language; ?>
      </div>  
      <div class="quick-user pull-left">
      <?php echo $currency; ?>
      </div> 
    </div>
    </div>
    <div class="main-menu topbar-right">
      <!-- menu -->
      <div id="pav-mainnav" class="pav-mainnav"><div class="pav-megamenu">
        <button data-toggle="offcanvas" class="btn btn-success canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span> Menu</button>
                  
        <?php
        /**
        * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
        */
        if (count($megamenu) && !empty($megamenu)) { echo $megamenu;?>
        <?php } elseif ($categories) { ?>
        <nav id="menu" class="navbar">
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <ul class="list-unstyled">
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
              </li>
              <?php } else { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
              <?php } ?>
            </ul>
          </div>
        </nav>
        <?php } ?>
      </div></div> 
      <!-- menu -->  
    </div>
  </div>
</nav>

  <div class="container">
    <div class="inside">
      <div class="row">
        <div class="hidden-xs col-xs-12 col-sm-4 col-md-4">
          <?php if( $content=$helper->getLangConfig('widget_support') ) {?>
            <div class="box-support">
              <?php echo $content; ?>
            </div>
          <?php } ?> 
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4 text-center">
          <!-- logo -->
          <?php if( $logoType=='logo-theme'){ ?>
          <div  id="logo-theme" class="logo-store"><a href="<?php echo $home; ?>" class="img-responsive"><span><?php echo $name; ?></span></a></div>
          <?php } elseif ($logo) { ?>
          <div id="logo" class="logo-store"><a href="<?php echo $home; ?>" class="img-responsive"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
          <?php } ?>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4 text-center hidden-xs">
          <?php echo $cart; ?>       
        </div>
      </div>
  </div>
  </div>
  <div class="header-bottom">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 hidden-xs">
        <div class="dropdown">
           <div class="panel panel-default panel-v1">
            <div class="bg-default panel-heading">
            <h4 class="panel-title">
              <?php echo $objlang->get("text_all_category"); ?>
            </h4>
            </div>
          </div>
          <?php if(!empty($verticalmenu)) { ?>
          <?php echo $verticalmenu; ?>
          <?php } ?>
        </div>
         
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 hidden-xs">
           <?php
            if (count($autosearch) && !empty($autosearch)) {
            echo $autosearch;
            } else {
            echo $search;
            }
            ?>
        </div>
      </div>
    </div>
  </div>
</header>
<div class="nav-search">
  <?php echo $search; ?>
</div>
