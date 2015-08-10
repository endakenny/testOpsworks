directory 'C:\ProgramData\Sentinel' do
  action :create
end

cookbook_file 'C:\ProgramData\Sentinel\WindowsBlue-KB3055381-x64.msu' do
	source 'WindowsBlue-KB3055381-x64.msu'
	action :create
end

# Reboot
reboot "now" do
  action :nothing
  reason 'Need to reboot'
end


# This also needs a reboot before we start using it
powershell_script "Install WMF5" do
  code <<-EOH
  & wusa C:/ProgramData/Sentinel/WindowsBlue-KB3055381-x64.msu /quiet /norestart
  EOH
  notifies :reboot_now, 'reboot[now]', :immediately
end

