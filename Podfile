# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def pods

  use_frameworks!
  # Pods for MiPromoSocios
  pod 'Cache'
  pod 'SwiftyUtils'
  pod 'Siesta', '~> 1.0'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'DateToolsSwift'
  pod 'AMPopTip'
  pod 'Alamofire', '~> 4.7'
  pod 'Siesta/UI', '~> 1.0'
  pod 'SDWebImage', '~> 4.0'
  pod 'YouTubePlayer'
  
end

target 'moviefy' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for moviefy
  pods
  target 'moviefyTests' do
    inherit! :search_paths
    # Pods for testing
    pods
  end

  target 'moviefyUITests' do
    inherit! :search_paths
    # Pods for testing
    pods
  end

end
