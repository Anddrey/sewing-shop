<?php 
/******************************************************
 *  Leo Opencart Theme Framework for Opencart 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@theme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 * ******************************************************/

class PtsWidgetCountdownproduct extends PtsWidgetPageBuilder {

		public $name = 'countdownproduct';
		public $group = 'product';
		
		public static function getWidgetInfo(){
			return  array('label' =>  ('Countdown Product'), 'explain' => 'Create Product Ajax With multiple Language', 'group' => 'product'  );
		}


		public function renderForm( $args, $data ){

			$helper = $this->getFormHelper();
			
			$products = (isset($data['params']['product']) && $data['params']['product']) ? $data['params']['product'] : array();
			$list_product = array();
			if($products){
				$this->load->model('catalog/product');
				foreach($products as $id_product){
					$product = $this->model_catalog_product->getProduct($id_product);
					$list_product[$id_product] = 	$product['name'];
				}
			}
			
			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
					array(
						'type'  => 'date',
						'label' => $this->l('Start Date'),
						'name'  => 'start_date',
						'default'=> '',
					),
					array(
						'type'  => 'date',
						'label' => $this->l('End Date'),
						'name'  => 'end_date',
						'default'=> '',
					),				
					array(
	                    'type'  	=> 'ajax_product',
	                    'label' 	=> $this->l('Product List'),
	                    'name'  	=> 'product[]',
	                    'default'	=> array(),
	                    'desc'		=> '',
						'products' 	=> $list_product
	                ),
	                array(
	                    'type' => 'textarea',
	                    'label' => $this->l('Content'),
	                    'name' => 'htmlcontent',
	                    'cols' => 40,
	                    'rows' => 10,
	                    'value' => true,
	                    'lang'  => true,
	                    'default'=> '',
	                    'autoload_rte' => true,
	                ),					
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Image Width'),
	                    'name'  => 'image_width',
	                    'default'=> 200,
	                    'desc'	=> '',
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Image Height'),
	                    'name'  => 'image_height',
	                    'default'=> 200,
	                    'desc'	=> '',
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
	            ////    
	                'id_language' => $default_lang
        	);  


			return  $helper->generateForm( $this->fields_form );

		}
		
		public function renderContent(  $args, $setting ){
			$t = array(
				'image_width'	=> '200',
				'image_height'	=> '200'
			);
			$setting = array_merge( $t, $setting );			
			$output = '';
			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			
			$setting['products'] = array();
			$id_products = isset($setting['product']) ? ($setting['product']) : array() ;
			
			if($id_products){
				foreach($id_products as $id_product){
					$result = $this->model_catalog_product->getProduct($id_product);
						
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
					} else {
						$image = false;
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}

					$product = array(
						'product_id' => $result['product_id'],
						'thumb'   	 => $image,
						'name'    	 => $result['name'],
						'price'   	 => $price,
						'special' 	 => $special,
						'rating'     => $rating,
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);	
						
					$setting['products'][] = $product;
				}
				
			}
			
			$languageID = $this->config->get('config_language_id');
			$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';

			$setting['html'] = isset($setting['htmlcontent_'.$languageID])?($setting['htmlcontent_'.$languageID]): "";
			
			$output = array('type'=>'html','data' => $setting );

	  		return $output;
		}

		 
	}
?>