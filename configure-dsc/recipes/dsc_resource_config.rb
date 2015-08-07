powershell_script "Configure LCM for dsc_resource" do
  code <<-EOH
    Configuration ConfigLCM
    {
        Node "localhost"
        {
            LocalConfigurationManager
            {
                RefreshMode = 'Disabled'
                RebootNodeIfNeeded = $false
                ConfigurationMode = "ApplyOnly"
            }
        }
    }
    ConfigLCM -OutputPath "#{Chef::Config[:file_cache_path]}\\DSC_LCM"
    Set-DscLocalConfigurationManager -Path "#{Chef::Config[:file_cache_path]}\\DSC_LCM"
  EOH
end