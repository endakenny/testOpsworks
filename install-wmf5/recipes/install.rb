directory 'C:\ProgramData\Sentinel' do
  action :create
end

cookbook_file 'C:\ProgramData\Sentinel\set_hosts.ps1' do
	source 'Windows6.1-KB2908075-x64'
	action :create
end