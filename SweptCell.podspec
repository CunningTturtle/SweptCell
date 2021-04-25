Pod::Spec.new do |s|
  s.name         = "SweptCell"
  s.version      = "1.0.2"
  s.summary      = "Custom sliding TableViewCell"
  s.homepage     = "https://github.com/CunningTturtle/SweptCell.git"
  s.license      = "MIT"
  s.author       = { "scottzg" => "1342811501@qq.com" }
  s.source       = { :git => "https://github.com/CunningTturtle/SweptCell.git", :tag => "#{s.version}" }
  s.source_files = "SweptCell/**/*.{swift}"
  s.frameworks = "UIKit"
  s.ios.deployment_target = "9.0"
  s.platform = :ios,'9.0'
  if s.respond_to? 'swift_version'
    s.swift_version = "5.0"
  end
end
