#
# Be sure to run `pod lib lint InfiniteScrollCollectionView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InfiniteScrollCollectionView'
  s.version          = '1.0'
  s.summary          = 'A Infinite horizontal scrolling collectionView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Create a infinitely scrolling horizontal collection view.
Limitations:
1. Total number of items in the collection view should sum to a width greater than or equal to width of collection view.
2. There will be repeating (one less than number of elements occupy the collection view bounds.width <N>) elements on both ends of data source array. To the begning N elements will be added from the end and at the end N elements will be added from the begning. So in identifying the elements please use some mechanism.
How To:
1. Add InfiniteScrollCollectionView in Storyboard or initWithFrame.
2. Set 'infiniteScrollDelegate'.
3. Call 'prepareDataSourceForInfiniteScroll' with data array.
4. Call 'setInitialOffset' on viewDidAppear.
5. Call 'infiniteScrollViewDidScroll' from 'scrollViewDidScroll' of this collectionView's delegate.

Thats it. Enjoy!
                       DESC

  s.homepage         = 'https://github.com/tmukammel/InfiniteScrollCollectionView'
  s.screenshot       = 'https://dl.dropboxusercontent.com/s/j61j4mfohp8k6ry/IMG_0965.PNG'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Twaha Mukammel' => 't.mukammel@aol.com' }
  s.source           = { :git => 'https://github.com/tmukammel/InfiniteScrollCollectionView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tmukammel'

  s.ios.deployment_target = '8.0'

  s.source_files = 'InfiniteScrollCollectionView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'InfiniteScrollCollectionView' => ['InfiniteScrollCollectionView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
