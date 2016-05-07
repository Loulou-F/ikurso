<?php
/* 
 * phpMyVisites : website statistics and audience measurements
 * Copyright (C) 2002 - 2006
 * http://www.phpmyvisites.net/ 
 * phpMyVisites is free software (license GNU/GPL)
 * Authors : phpMyVisites team
*/

// $Id: InstallGeneralSetup.class.php 29 2006-08-18 07:35:21Z matthieu_ $


require_once INCLUDE_PATH."/core/include/InstallModule.class.php";
require_once INCLUDE_PATH."/core/forms/FormGeneralConfig.class.php";

class InstallGeneralSetup extends InstallModule
{
    var $viewTemplate = "install/general_setup.tpl";
	
	var $stepNumber = 5;
    
	function InstallGeneralSetup()
	{
		
		parent::InstallModule();
		
	}

	function process()
	{
		
		$next_step = false;
		
		$form = new FormGeneralConfig( $this->tpl );

		$done = $form->process();
				
		if($done)
		{
			$next_step = true;
			$this->stepNumber = 6;
		}
		
		$this->tpl->assign("show_next_step", $next_step);
	}
}
?>