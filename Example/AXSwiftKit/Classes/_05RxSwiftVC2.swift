//
//  _05RxSwiftVC2.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/31.
//  Copyright © 2021 axinger. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


struct ViewModel {
    var dataArray:[String] = []
}

class _05RxSwiftVC2: UITableViewController {
    
    let disposeBag = DisposeBag()
    var viewModel = ViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableViewRX()
    }
    
    // to prevent swipe to delete behavior
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    /// tableView -- RX
    func setupTableViewRX() {
       
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.delegate = nil;
//        tableView.dataSource = nil;
        
        let items = Observable.just(
            (0..<20).map { "\($0)" }
        )

        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @ row \(row)"
            }
            .disposed(by: disposeBag)


        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
               print("Tapped `\(value)`")
            })
            .disposed(by: disposeBag)

        tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                print("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)
        
        
        
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
//        tableView.rx
//            .setDataSource(self)
//            .disposed(by: disposeBag)
        
        
    }

}
