//import XCTest
import Quick
import Nimble
import AXSwiftKit
@testable import AXSwiftKit_Example

// 直接点击这里运行
class Tests: QuickSpec {
    
    override func spec(){
        //所有测试放在这里
        
        var vc: _01RootVC!
        
        describe("测试1") {
            
            beforeEach {
                vc = _01RootVC.init()
                _ = vc.view
            }
            
            // context用于指定条件或状态
            context("context用于指定条件或状态", closure: {
                
                var cell: UITableViewCell!
                
                beforeEach {
                    cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                }
                
                // it用于描述测试的方法名
                it("it only emited once", closure: {
                    expect(vc.test()).to(equal(1))
                    
                    expect(cell.textLabel?.text).to(equal("1 _01ContentViewController"))
                    
                })
            })
        }
        
    }
    
    
}
