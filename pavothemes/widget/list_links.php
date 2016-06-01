<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

class PtsWidgetList_links extends PtsWidgetPageBuilder {

		public $name = 'list_links';
		public $group = 'product';

		public static function getWidgetInfo(){
			return array('label' => ('Get List Links'), 'explain' =>'allow add links', 'group' => 'opencart'  );
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

			$this->load->model("catalog/category");
	
			$t = array(
				'links'	        => array(),
			);
			$setting = array_merge( $t, $setting );

			// heading title
			$languageID = $this->config->get('config_language_id');
			$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';

			// get Links
			$categories = array();
			foreach ($setting['links'] as $link) {
				$category = $this->model_catalog_category->getCategory($link);
				if( isset($category) ){ 
					$categories[] = array(
						'category_id' => $category['category_id'],
						'name' => $category['name'],
						'href' => $this->url->link('product/category', 'path=' . $category['category_id']),
					);
				}
			}
			$setting['categories'] = $categories;



			$output = array('type'=>'product','data' => $setting);
			return $output;
		}

	}
?>