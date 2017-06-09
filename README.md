# MKWalkthrough

[![CI Status](http://img.shields.io/travis/minamakary25/MKWalkthrough.svg?style=flat)](https://travis-ci.org/minamakary25/MKWalkthrough)
[![Version](https://img.shields.io/cocoapods/v/MKWalkthrough.svg?style=flat)](http://cocoapods.org/pods/MKWalkthrough)
[![License](https://img.shields.io/cocoapods/l/MKWalkthrough.svg?style=flat)](http://cocoapods.org/pods/MKWalkthrough)
[![Platform](https://img.shields.io/cocoapods/p/MKWalkthrough.svg?style=flat)](http://cocoapods.org/pods/MKWalkthrough)

## Screenshots 
<img src="./MKWalkthrough.gif" alt="Screenshot" width="200"/>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

MKWalkthrough is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MKWalkthrough"
```
## Usage

### Circular Walkthrough

#### On UIBarbuttonItem

```swift
MKWalkthrough.showCircularWalkthrough(onBarButtonItem: navigationItem.rightBarButtonItem!, radius: 50, hint: "Add your hint here!")
```

#### Using CGPoint

```swift
MKWalkthrough.showCircularWalkthrough(withCenter: self.view.center, inView: self.view, radius: 50, hint: "Add your hint here!")
```

## Author

minamakary25, minamakary25@gmail.com

## License

MKWalkthrough is available under the MIT license. See the LICENSE file for more info.
