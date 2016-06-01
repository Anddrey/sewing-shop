<?php $objlang = $this->registry->get('language');  ?>
<div id="cart" class="clearfix">
    <div data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="dropdown-toggle">      
      <div class="cart-inner">
        <a href="">
          <i class="icon-cart"></i>
          <span id="cart-total" class="cart-total radius-x "><?php echo substr($text_items, 0, strpos($text_items, ' ')+1); ?></span>
          <?php 
            $res = explode("-", $text_items);
          ?>
          <div class="wrap-cart">
            <span id="text-items"><?php echo $res[1]; ?></span>  <br>         
          <span class="text-cart"><?php echo $objlang->get("text_heading_title"); ?><span class="fa fa-angle-down"></span></span>
          </div>
          
        </a>
      </div>
    </div>
    <ul class="dropdown-menu content">
      <?php if ($products || $vouchers) { ?>
      <li>
        <table class="table">
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-center"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <br />
              - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
              <?php } ?></td>
            <td class="text-right">x <?php echo $product['quantity']; ?></td>
            <td class="text-right"><?php echo $product['total']; ?></td>
            <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-success btn-xs"><i class="fa fa-times"></i></button></td>
          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td class="text-center"></td>
            <td class="text-left"><?php echo $voucher['description']; ?></td>
            <td class="text-right">x&nbsp;1</td>
            <td class="text-right"><?php echo $voucher['amount']; ?></td>
            <td class="text-center text-success"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-success btn-xs"><i class="fa fa-times"></i></button></td>
          </tr>
          <?php } ?>
        </table>
      </li>
      <li>
        <div class="table-responsive space-padding-5">
          <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
          <p class="text-right space-padding-20">
            <a href="<?php echo $cart; ?>" class="btn btn-sm btn-success btn-outline">
              <?php echo $text_cart; ?>
            </a>&nbsp;&nbsp;&nbsp;
            <a href="<?php echo $checkout; ?>" class="btn btn-sm btn-success btn-outline">
              <?php echo $text_checkout; ?></a>
          </p>
        </div>
      </li>
      <?php } else { ?>
      <li>
        <p class="text-center"><?php echo $text_empty; ?></p>
      </li>
      <?php } ?>
    </ul>
</div>
