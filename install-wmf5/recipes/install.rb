directory 'C:\ProgramData\Sentinel' do
  action :create
end

cookbook_file 'C:\ProgramData\Sentinel\Windows6.1-KB2908075-x64.msu' do
	source 'Windows6.1-KB2908075-x64.msu'
	action :create
end

powershell_script "Configure LCM for dsc_resource" do
  code <<-EOH
  wusa C:/ProgramData/Sentinel/Windows6.1-KB2908075-x64.msu /quiet /norestart
  EOH
end