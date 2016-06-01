<div class="breadcrumbs light-style breadcrumbs-left bg-info space-20">
    <div class="container">
        <h2>Shortcodes</h2>
        <?php if( isset($breadcrumbs) ) { ?>
			 <ul class="list-unstyled breadcrumb-links">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
			</ul>
		<?php } ?>
    </div>
</div>