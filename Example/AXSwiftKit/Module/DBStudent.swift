import GRDB

/// 学生类
struct DBStudent: Codable {
    /// 名字
    var name: String?
    /// 昵称
    var nick_name: String?
    /// 年龄
    var age: Int?
    /// 性别
    var gender: Bool?
    
    /// 设置行名
    private enum Columns: String, CodingKey, ColumnExpression {
        /// 名字
        case name
        /// 昵称
        case nick_name
        /// 年龄
        case age
        /// 性别
        case gender
    }
}

extension DBStudent: MutablePersistableRecord, FetchableRecord {
    /// 获取数据库对象
    private static let dbQueue: DatabaseQueue = DBManager.dbQueue
    
    //MARK: 创建
    /// 创建数据库
    private static func createTable() -> Void {
        try! self.dbQueue.inDatabase { (db) -> Void in
            // 判断是否存在数据库
            if try db.tableExists(TableName.student) {
                debugPrint("表已经存在")
                return
            }
            // 创建数据库表
            try db.create(table: TableName.student, temporary: false, ifNotExists: true, body: { (t) in
                // ID
                t.column(Columns.name.rawValue, Database.ColumnType.text)
                // 名字
                t.column(Columns.nick_name.rawValue, Database.ColumnType.text)
                // 朝代
                t.column(Columns.age.rawValue, Database.ColumnType.integer)
                // 简介
                t.column(Columns.gender.rawValue, Database.ColumnType.boolean)
            })
        }
    }
    
    //MARK: 插入
    /// 插入单个数据
    static func insert(DBStudent: DBStudent) -> Void {
      
        // 判断是否存在
        guard self.query(name: DBStudent.name!) == nil else {
            debugPrint("插入学生 内容重复")
            // 更新
            self.update(DBStudent: DBStudent)
            return
        }
        
        // 创建表
        self.createTable()
        // 事务
        try! self.dbQueue.inTransaction { (db) -> Database.TransactionCompletion in
            do {
                var DBStudentTemp = DBStudent
                // 插入到数据库
                try DBStudentTemp.insert(db)
                return Database.TransactionCompletion.commit
            } catch {
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    //MARK: 查询
    static func query(name: String) -> DBStudent? {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> DBStudent? in
            return try DBStudent.filter(Column(Columns.name.rawValue) == name).fetchOne(db)
        })
    }
    
    /// 查询所有
    static func queryAll() -> [DBStudent] {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> [DBStudent] in
            return try DBStudent.fetchAll(db)
        })
    }
    
    //MARK: 更新
    /// 更新
    static func update(DBStudent: DBStudent) -> Void {
        /// 创建数据库表
        self.createTable()
        // 事务 更新场景
        try! self.dbQueue.inTransaction { (db) -> Database.TransactionCompletion in
            do {
                // 赋值
                try DBStudent.update(db)
                return Database.TransactionCompletion.commit
            } catch {
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    //MARK: 删除
    /// 根据名字删除学生
    static func delete(name: String) -> Void {
        // 查询
        guard let DBStudent = self.query(name: name) else {
            return
        }
        // 删除
        self.delete(DBStudent: DBStudent)
    }
    
    /// 删除单个学生
    static func delete(DBStudent: DBStudent) -> Void {
        // 是否有数据库表
        self.createTable()
        // 事务
        try! self.dbQueue.inTransaction { (db) -> Database.TransactionCompletion in
            do {
                // 删除数据
                try DBStudent.delete(db)
                return Database.TransactionCompletion.commit
            } catch {
                return Database.TransactionCompletion.rollback
            }
        }
    }
}
