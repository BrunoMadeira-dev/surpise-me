# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

target 'Surprise Me' do
  # Comment the next line if you don't want to use dynamic frameworks
  source 'https://github.com/CocoaPods/Specs.git'
  use_frameworks!

  # Pods for Surprise Me

  pod 'CLTypingLabel'
  pod 'Alamofire'
  pod 'Kingfisher'
  pod 'MBProgressHUD'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'

  target 'Surprise MeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Surprise MeUITests' do
    # Pods for testing
  end

end


post_install do |installer|
#       installer.pods_project.build_configurations.each do |config|
#           config.build_settings.delete('CODE_SIGNING_ALLOWED')
#           config.build_settings.delete('CODE_SIGNING_REQUIRED')
#        end
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
           end
        end
end



