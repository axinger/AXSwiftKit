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
public final class CIImageKit<Object> {
    public let obj: Object
    public init(_ obj: Object) {
        self.obj = obj
    }
}
// protocol中 需要用 associatedtype 来预设一个类型
public protocol CIImageDownloaderProtocol {
    associatedtype type
    var ci: type { get }
}

extension CIImageDownloaderProtocol {
    public var ci: CIImageKit<Self> {
        get {
            return CIImageKit(self)
        }
    }
}

extension UIImageView: CIImageDownloaderProtocol {}


extension CIImageKit where Object: UIImageView {
    func setImage(url: URL, placeHolder: UIImage?) {
        // 实现 下载图片并缓存、展示的逻辑
        
        self.obj.image = UIImage.init(named: "")
    }
}

func test1() {
    
    let image = UIImageView()
    image.ci.setImage(url: URL.init(string: "https://www.manoboo.com")!, placeHolder: nil)
    
}
