Pod::Spec.new do |s|
  s.name         = "SweptCell"
  s.version      = "1.0.7"
  s.summary      = "Custom sliding TableViewCell"
  s.homepage     = "https://cocoapods.org/pods/SweptCell"
  s.author       = { "scottzg" => "1342811501@qq.com" }
  s.source       = { :git => "https://github.com/CunningTturtle/SweptCell.git", :tag => s.version }
  s.source_files =  'Sources/*.swift'
  s.frameworks = "UIKit"
  s.ios.deployment_target = "9.0"
  s.platform = :ios,'9.0'
  s.swift_version = "5.0"
  s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }
end



  s.source_files = 'Source/*.swift'

  s.swift_version = '5.0'
