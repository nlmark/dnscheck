<?php
	require_once('geoip.inc');

	function getDefaultLanguage()
	{
		$IPAddress = $_SERVER['REMOTE_ADDR'];
		
		$gi = geoip_open(dirname(__FILE__) . "/GeoIP.dat", GEOIP_STANDARD);

		$country = geoip_country_code_by_addr($gi, $IPAddress);
		switch ($country)
		{
			case 'SE':
				return 'sv';
				break;
			case 'NL':
				return 'nl';
				break;
			default:
				return 'en';
				break;	
		}	
	}

?>
