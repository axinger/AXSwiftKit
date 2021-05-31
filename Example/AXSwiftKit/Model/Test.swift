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

extension AXImageDownloaderProtocol {
    public var ax: AXIImageKit<Self> {
        get {
            return AXIImageKit(self)
        }
    }
}

extension AXIImageKit where AnyOne: UIImageView {
    func setImage(url: URL, placeHolder: UIImage?) {
        // 实现 下载图片并缓存、展示的逻辑
        self.one.image = UIImage.init(named: "")
    }
}

extension UIImageView: AXImageDownloaderProtocol {}

extension AXIImageKit where AnyOne: UIButton {
    func setImage(url: URL, placeHolder: UIImage?) {
        // 实现 下载图片并缓存、展示的逻辑
        self.one.imageView?.image = UIImage.init(named: "")
    }
}
extension UIButton: AXImageDownloaderProtocol {}

func test() {
    let image = UIImageView()
    image.ax.setImage(url: URL.init(string: "https://www.manoboo.com")!, placeHolder: nil)
    
    let btn = UIButton()
    
    btn.ax.setImage(url: URL.init(string: "https://www.manoboo.com")!, placeHolder: nil)
}
