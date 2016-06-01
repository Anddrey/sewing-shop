<?php
/******************************************************
 *  Leo Opencart Theme Framework for Opencart 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 * ******************************************************/

class PtsWidgetListproduct_home1 extends PtsWidgetPageBuilder {

		public $name = 'listproduct_home1';
		public $group = 'product';

		public static function getWidgetInfo(){
			return array('label' => ('Get List products'), 'explain' => 'this widget only support for layout home 1', 'group' => 'product'  );
		}


		public function renderForm( $args, $data ){

			$key = time();

			$helper = $this->getFormHelper();


			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
	            	// list links
	            	array(
	                    'type'  => 'links-category',
	                    'label' => $this->l('Links Category'),
	                    'name'  => 'links',
	                    'default'=> array(),
	                    'desc'	=> "Add links category",
	                ),

	            	// column 1
	            	array(
	                    'type'  => 'text',
	                    'label' => $this->l('Title 1 List Product'),
	                    'lang'  => 1,
	                    'name'  => 'title_1',
	                    'default'=> "Title",
	                    'desc'	=> "",
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('style class'),
	                    'name'  => 'style1',
	                    'default'=> "",
	                    'desc'	=> "",
	                ),
	            	array(
	                    'type'  => 'text',
	                    'label' => $this->l('List Products'),
	                    'name'  => 'product1_id',
	                    'default'=> '42,44,47,48',
	                    'desc'	=> '',
	                ),
	            	// column 2
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Title 2 List Product'),
	                    'lang'  => 1,
	                    'name'  => 'title_2',
	                    'default'=> "Title",
	                    'desc'	=> '',
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('style class'),
	                    'name'  => 'style2',
	                    'default'=> "",
	                    'desc'	=> "",
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('List Products'),
	                    'name'  => 'product2_id',
	                    'default'=> '42,44,47,48',
	                    'desc'	=> '',
	                ),
	                // banner
	                array(
	                    'type'  => 'image',
	                    'label' => $this->l('Banner Image'),
	                    'name'  => 'banner_img',
	                    'default'=> '',
	                    'desc'	=> 'Put image folder in the image folder ROOT_SHOP_DIR/image/'
	                ),
	                 // banner prefix class
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Image Prefix Class'),
	                    'name'  => 'img_class',
	                    'default'=> 'right',
	                    'desc'	=> 'Alow change banner LTR or RTL'
	                ),
	               	

	            ),
	      		 'submit' => array(
	                'title' => $this->l('Save'),
	                'class' => 'button'
           		 )
	        );


		 	$default_lang = (int)$this->config->get('config_language_id');

			$helper->tpl_vars = array(
	                'fields_value' => $this->getConfigFieldsValues( $data  ),
	                'id_language' => $default_lang
        	);


			return  $helper->generateForm( $this->fields_form );
		}

		public function renderContent( $args, $setting ){
			$this->load->model('catalog/category');
			$this->load->model('catalog/product');
			$this->load->language('module/themecontrol');

			$t = array(
				'links'	        => array(),
				'image_height'  => '153',
				'image_width'   => '153',
				
				'limit'			=> 9,
				'itemsperpage'	=> 3,
				'cols'			=> 3,

				'itemsperpage2'	=> 3,
				'cols2'			=> 1,

				'style1'		=> '',
				'style2'		=> '',


				'img_class'     => 'right',
			);
			$setting = array_merge( $t, $setting );

			// heading title
			$languageID = $this->config->get('config_language_id');
			$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';

			// get Links
			$categories = array();
			foreach ($setting['links'] as $link) {
				$category = $this->model_catalog_category->getCategory($link);
				$categories[] = array(
					'category_id' => $category['category_id'],
					'name' => $category['name'],
					'href' => $this->url->link('product/category', 'path=' . $category['category_id']),
				);
			}
			$setting['categories'] = $categories;

			// title
			$setting['title_1'] = isset($setting['title_1_'.$languageID])?$setting['title_1_'.$languageID]:'';
			$setting['title_2'] = isset($setting['title_2_'.$languageID])?$setting['title_2_'.$languageID]:'';

			// list product1
			$setting['list1'] = $this->getProduct($setting, $setting['product1_id'], 500, 500);

			// list product2
			$setting['list2'] =  $this->getProduct($setting, $setting['product2_id'], 80, 80);

			// banner
			$placeholder = $this->model_tool_image->resize('no_image.png', 279, 406);
			$banner = $this->model_tool_image->resize($setting['banner_img'], 279, 406);


			if ($setting['banner_img'] && file_exists(DIR_IMAGE . $setting['banner_img'])) {
				$image = $banner;
			} else {
				$image = $placeholder;
			}

			$setting['banner'] = $image;


			$output = array('type'=>'product','data' => $setting);
			return $output;
		}

		public function getProduct($setting, $data, $img_width, $img_height){
			$products = array();
			$this->load->model('catalog/product');
			$this->load->model('tool/image');

			$id_products = explode(",", $data);

			if($id_products){
				foreach ($id_products as $id_product) {
					$product_info = $this->model_catalog_product->getProduct( $id_product );
					if ($product_info) {
						if ($product_info['image']) {
							$image = $this->model_tool_image->resize($product_info['image'], $img_width, $img_height);
						} else {
							$image = false;
						}
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}
						if ((float)$product_info['special']) {
							$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}
						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
						} else {
							$tax = false;
						}
						if ($this->config->get('config_review_status')) {
							$rating = $product_info['rating'];
						} else {
							$rating = false;
						}
						$products[] = array(
							'product_id'  => $product_info['product_id'],
							'thumb'       => $image,
							'name'        => $product_info['name'],
							'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
							'price'       => $price,
							'special'     => $special,
							'tax'         => $tax,
							'rating'      => $rating,
							'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
						);
					}
				}
			}
			return $products;
		}
	}
?>