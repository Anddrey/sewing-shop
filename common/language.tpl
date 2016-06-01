<?php if (count($languages) > 1) { ?>
<div class="language-wrapper">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group">
    <button type="button" class="btn-dropdown" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <span><img class="hidden" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"></span>
    <?php } ?>
    <?php } ?>
    <span><?php echo $text_language; ?></span>
    <span class="fa fa-angle-down"></span>
  </button>
    <ul class="dropdown-menu dropdown">
      <?php foreach ($languages as $language) { ?>
      <li><a class="list-item" href="<?php echo $language['code']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
