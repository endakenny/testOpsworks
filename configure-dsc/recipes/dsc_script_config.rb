#
# Cookbook Name:: configure-dsc
# Recipe:: dsc_script_config
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Resource to set up the Local Configuratoion manager so that it is ready to run Chef dsc_script resources. 
# Note this is different from how it needs to be configured for the chef dsc_resource resources
powershell_script "Configure LCM for dsc_script" do
  code <<-EOH
    Configuration ConfigLCM
    {
    	Node "localhost"
	    {
	        LocalConfigurationManager
	        {
	            RefreshMode = "Push"
		 		RebootNodeIfNeeded = $false
	            ConfigurationMode = "ApplyOnly"
	        }
	    }
	}
		ConfigLCM -OutputPath "#{Chef::Config[:file_cache_path]}\\DSC_LCM"
		Set-DscLocalConfigurationManager -Path "#{Chef::Config[:file_cache_path]}\\DSC_LCM"   
    EOH
end

