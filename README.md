# InfiniteScrollCollectionView

[![CI Status](http://img.shields.io/travis/Twaha Mukammel/InfiniteScrollCollectionView.svg?style=flat)](https://travis-ci.org/Twaha Mukammel/InfiniteScrollCollectionView)
[![Version](https://img.shields.io/cocoapods/v/InfiniteScrollCollectionView.svg?style=flat)](http://cocoapods.org/pods/InfiniteScrollCollectionView)
[![License](https://img.shields.io/cocoapods/l/InfiniteScrollCollectionView.svg?style=flat)](http://cocoapods.org/pods/InfiniteScrollCollectionView)
[![Platform](https://img.shields.io/cocoapods/p/InfiniteScrollCollectionView.svg?style=flat)](http://cocoapods.org/pods/InfiniteScrollCollectionView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## About

Create a infinitely scrolling horizontal collection view.

## Limitations

1. Total number of items in the collection view should sum to a width greater than or equal to width of collection view.
2. There will be repeating (one less than number of elements occupy the collection view bounds.width -> N) elements on both ends of data source array. To the begning N elements will be added from the end and at the end N elements will be added from the begning. So in identifying the elements please use some mechanism.

## How To

1. Add InfiniteScrollCollectionView in Storyboard or initWithFrame.
2. Set 'infiniteScrollDelegate'.
3. Call 'prepareDataSourceForInfiniteScroll' with data array.
4. Call 'setInitialOffset' on viewDidAppear.
5. Implement 'uniformItemSizeInCollectionView' of InfiniteScrollCollectionViewDelegatge.
6. Call 'infiniteScrollViewDidScroll' from 'scrollViewDidScroll' of this collectionView's delegate.

Thats it. Enjoy!

## Installation

InfiniteScrollCollectionView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "InfiniteScrollCollectionView"
```

## Author

Twaha Mukammel, t.mukammel@aol.com

## License

InfiniteScrollCollectionView is available under the MIT license. See the LICENSE file for more info.
