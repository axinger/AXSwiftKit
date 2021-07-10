# AXSwiftKit

[![CI Status](https://img.shields.io/travis/axinger/AXSwiftKit.svg?style=flat)](https://travis-ci.org/axinger/AXSwiftKit)
[![Version](https://img.shields.io/cocoapods/v/AXSwiftKit.svg?style=flat)](https://cocoapods.org/pods/AXSwiftKit)
[![License](https://img.shields.io/cocoapods/l/AXSwiftKit.svg?style=flat)](https://cocoapods.org/pods/AXSwiftKit)
[![Platform](https://img.shields.io/cocoapods/p/AXSwiftKit.svg?style=flat)](https://cocoapods.org/pods/AXSwiftKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AXSwiftKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AXSwiftKit'
```

## Author

axinger, axingrun@outlook.com

## License

AXSwiftKit is available under the MIT license. See the LICENSE file for more info.

## 标签
```
MARK: 为标签
TODO: 为待完成任务
FIXME: 为待修改bug
冒号后面加 - 则会在标签上面显示分割线
```

## extension where
```
/// 也为 CusProtocol 扩展了一个 sayHello() 函数，
///但也限定了范围：只有当一个类实现了 CusProtocol 接口，并且这个类同时也是 UIView 的子类时，才可以调用 sayHello() 函数。

protocol CusProtocol {}

extension  CusProtocol where Self:UIView {
    static func sayHello(){
        print("Hello")
    }
}

```
## 缺省参数
```swift
func test1(name: String, lowercase: Bool = true)  {
    
    print(name,lowercase)
}

test1(name: "", lowercase: true)
test1(name: "")

/// 参数默认值
func show(name : String = "jim") {
    
    print("show=\(name)")
    
}
show()
show(name: "tom")


```

## 弱引用
```
weak 和 unowned 类似，不同点是 unowned 是永远有值的。
weak可以声明可选型，很多时候我们不想声明一个可选型，可选型代表着风险，此时就可将属性声明成 unowned
```
