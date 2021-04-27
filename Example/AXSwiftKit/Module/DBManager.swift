//
//  DBManager.swift
//  AXiOSKit
//
//  Created by 小星星吃KFC on 2021/4/27.
//  Copyright © 2021 axinger. All rights reserved.
//

import Foundation

import GRDB

struct DataBaseName {
    /// 数据库名字
    static let test = "test.db"
}

/// 数据库表名
struct TableName {
    /// 学生
    static let student = "student"
}

/// 数据库连接
class DBManager: NSObject {
    /// 数据库路径
    private static var dbPath: String = {
        // 获取工程内容数据库名字
        let filePath: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!.appending("/\(DataBaseName.test)")
        
        //print("数据库地址：", filePath as Any)
        return filePath
    }()
    
    /// 数据库配置
    private static var configuration: Configuration = {
        // 配置
        var configuration = Configuration()
        // 设置超时
        configuration.busyMode = Database.BusyMode.timeout(5.0)
        // 试图访问锁着的数据
        //configuration.busyMode = Database.BusyMode.immediateError
        
        return configuration
    }()
    
    // MARK: 创建数据 多线程
    /// 数据库 用于多线程事务处理
    static var dbQueue: DatabaseQueue = {
        // 创建数据库
        let db = try! DatabaseQueue(path: DBManager.dbPath, configuration: DBManager.configuration)
        db.releaseMemory()
        // 设备版本
        return db
    }()
}
