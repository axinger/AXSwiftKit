//
//  Test.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/28.
//  Copyright © 2021 axinger. All rights reserved.
//
//http://www.cocoachina.com/articles/20426
import UIKit

//protocol + 泛型
public final class AXIImageKit<AnyOne> {
    public let one: AnyOne
    public init(_ one: AnyOne) {
        self.one = one
    }
}
// protocol中 需要用 associatedtype 来预设一个类型
public protocol AXImageDownloaderProtocol {
    associatedtype type
    var ax: type { get }
}
/**
 我们声明了一个CIImageDownloaderProtocol协议，对于遵从了该协议的类，都有一个CIImageKit类型的对象，
 
 */
extension AXImageDownloaderProtocol {
    public var ax: AXIImageKit<Self> {
        get {
            return AXIImageKit(self)
        }
    }
}

/**
 
 protocol aProtocol{}
 extension aProtocol where Self:UIView{
 //只给遵守myProtocol协议的UIView添加了拓展
 //强大的协议拓展  可以给协议添加默认实现   面向协议编程的基础
 func getString() -> String{
 return "string"
 }
 
 }
 
 */



extension UIImageView: AXImageDownloaderProtocol {}
extension AXIImageKit where AnyOne: UIImageView {
    func setImage(url: URL, placeHolder: UIImage?) {
        // 实现 下载图片并缓存、展示的逻辑
        self.one.image = UIImage.init(named: "")
    }
}


extension UIButton: AXImageDownloaderProtocol {}
extension AXIImageKit where AnyOne: UIButton {
    func setImage(url: URL, placeHolder: UIImage?) {
        // 实现 下载图片并缓存、展示的逻辑
        self.one.imageView?.image = UIImage.init(named: "")
    }
}

func test() {
    let image = UIImageView()
    image.ax.setImage(url: URL.init(string: "https://www.manoboo.com")!, placeHolder: nil)
    
    let btn = UIButton()
    
    btn.ax.setImage(url: URL.init(string: "https://www.manoboo.com")!, placeHolder: nil)
}
