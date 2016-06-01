

<?php 
$load = $this->registry->get("load");
$language = $load->language("module/themecontrol");
$text_sale = $language['text_sale'];
$ourl = $this->registry->get('url'); 
$objlang = $this->registry->get('language'); 
?>

<div class="product-block text-center item-default" itemtype="http://schema.org/Product" itemscope> 

  <div class="block-img text-center">
    <?php if ($product['thumb']) {    ?>
      
      <div class="image">
        <?php if( $product['special'] ) {   ?>
          <span class="product-label ribbon"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
        <?php } ?>
        <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
          <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        </a>
      </div>
    <?php } ?>
  
  </div>
         
  <div class="product-meta">      
    <div class="top">
       <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
      <?php if ($product['price']) { ?>
      <div class="price" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
        <?php if (!$product['special']) {  ?>
          <span class="price-new"><?php echo $product['price']; ?></span>
          <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
          <meta content="<?php echo $p[0]; ?>" itemprop="price">
          <?php } ?>
        <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span>
          <span class="price-old"><?php echo $product['price']; ?></span> 
          <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
          <meta content="<?php echo $p[0]; ?>" itemprop="price">
          <?php } ?>

        <?php } ?>
        <meta content="<?php // echo $this->currency->getCode(); ?>" itemprop="priceCurrency">
      </div>
      <?php } ?>    
        <?php if( isset($product['description']) ){ ?> 
    <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
    <?php } ?> 
      
    
    <?php if ( isset($product['rating']) ) { ?>
      <div class="rating">
        <?php for ($is = 1; $is <= 5; $is++) { ?>
        <?php if ($product['rating'] < $is) { ?>
        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
        <?php } else { ?>
        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i>
        </span>
        <?php } ?>
        <?php } ?>
      </div>
    <?php } ?>
    </div>
     
 
  <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
    <div class="cart">            
      <button data-loading-text="Loading..." class="btn btn-sm btn-success radius-3x" type="button" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
        <i class="icon-cart"></i> 
        <span class=""><?php echo $objlang->get('button_cart'); ?></span>
      </button>
    </div>
  <?php } ?>
<div class="action">
<?php if ( isset($quickview) && $quickview ) { ?>
    <div class="quickview space-margin-tb-10">
       <a class="iframe-link radius-3x btn btn-default btn-sm" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>" title="<?php echo $objlang->get('quick_view'); ?>">
      <span><?php echo $objlang->get('quick_view'); ?></span>
    </a>
    </div>
    <?php } ?>
 
    <div class="bottom text-center">

    <div class="wishlist">
        <button class="btn btn-sm " type="button" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i><span class=""><?php echo $objlang->get('button_wishlist'); ?></span></button> 
      </div>      
      
      <div class="compare">     
        <button class="btn btn-sm" type="button" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-retweet"></i><span class=""><?php echo $objlang->get('button_compare'); ?></span></button> 
      </div>  
       <!-- zoom image-->
        <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
        <div class="zoom ">
          <a href="<?php echo $zimage;?>" class="product-zoom btn btn-sm" title="<?php echo $product['name']; ?>">
          <i class="fa fa-search-plus"></i>
          <span>
          <?php echo $objlang->get('zoom'); ?></span>
          </a>
        </div>
        <?php } ?>
        
      
    </div>  
      </div>
  </div>  
</div>





