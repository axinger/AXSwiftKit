//
//  _02View.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/12/17.
//  Copyright © 2020 axinger. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView2: View {
    ///@State是专门为存储在一个视图中的简单属性而设计的。
    ///因此，苹果建议我们向这些属性添加私有访问控制，
    ///比如：@State private var tapCount = 0。
    @State private var tapCount = 0
    
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    
    @State private var selectedStudent = 1
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing:10){
                
                Button("Tap Count: \(tapCount)") {
                    self.tapCount += 1
                    print("按钮")
                }
                Form {
                    Text("文本框输入内容是 \(name)")
                    /// TextField 需要绑定值 $属性
                    TextField("输入内容", text: $name).keyboardType(.decimalPad)
                }
                Form {
                    ForEach(0 ..< 4) {
                        Text("Row \($0)")
                    }
                }
                
                
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0 ..< students.count) {
                        Text(self.students[$0])
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())
                
                
                Text("You chose: Student # \(students[selectedStudent])")
                
                Text("\(32.1, specifier: "%.2f")")
                Text(String(format:"%.2f",321.0))
                
            }
        }.navigationBarTitle("AAA", displayMode: .inline)
    }
}



//#if DEBUG
@available(iOS 13.0.0, *)
struct Pre: PreviewProvider {
    static var previews: some View{
        //        ContentView()
        ContentView2()
    }
}
//#endif
