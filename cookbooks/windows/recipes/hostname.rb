#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: windows
# Recipe:: default
#
# Copyright:: 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# change the computer's hostname
depends "powershell"

powershell "rename hostname" do
  code <<-EOH
  $computer_name = Get-Content env:computername
  $new_name = Read-Host 'Enter new server name'
  $sysInfo = Get-WmiObject -Class Win32_ComputerSystem
  $sysInfo.Rename($new_name)
  EOH
end