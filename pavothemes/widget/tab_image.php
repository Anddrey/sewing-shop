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

class PtsWidgetTab_image extends PtsWidgetPageBuilder {

		public $name = 'tab_image';
		public $group = 'image';

		public static function getWidgetInfo(){
			return array('label' => ('Tab Image'), 'explain' => 'Tab Images ', 'group' => 'image'  );
		}


		public function renderForm( $args, $data ){

			$helper = $this->getFormHelper();
			
			
			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
	            	array(
	                    'type'  => 'featured-image',
	                    'label' => $this->l(''),
	                    'name'  => 'image_featured',
	                    'default'=> '',
	                    'desc'	=> 'Add List Featured Image',
	                ),
					// width && height
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Width'),
	                    'name'  => 'image_width',
	                    'default'=> 200,
	                    'desc'	=> '',
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Height'),
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
	                'fields_value' => $this->getConfigFieldsValues($data),
	                'id_language' => $default_lang
        	);
			
			return  $helper->generateForm( $this->fields_form );
		}

		public function renderContent(  $args, $setting ){
			$default = array(
					'widget_name' => '',
					'show_title' => 1,
					'addition_cls' => '',
					'image_width' => 200,
					'image_height' => 200,
					'image_featured' => array(),
				);
				
			$setting = array_merge( $default, $setting );
			$languageID = $this->config->get('config_language_id');
        	$setting['heading_title'] = isset($setting['widget_title_'.$languageID]) ? $setting['widget_title_'.$languageID] : '';	
			$output = array('type'=>'image','data' => $setting );

	  		return $output;
		}
	}
?>