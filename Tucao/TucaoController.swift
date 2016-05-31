//
//  TucaoController.swift
//  Tucao
//
//  Created by user on 2016/05/31.
//  Copyright © 2016年 kaka. All rights reserved.
//
import Bond
import RxSwift
import RxCocoa
import UIKit
import SDWebImage

class TucaoController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    let model = TucaoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTucaoInfo()
    }
    
    private func setTucaoInfo() {
        model.getTucaoInfo()
        
        tableView.separatorStyle = .None
        tableView.rowHeight = 200
        tableView.registerClass(TucaoCell.self, forCellReuseIdentifier: "Cell")
        
        let array = ObservableArray<ObservableArray<TucaoInfo>>()
        array.append(model.items)
        array.bindTo(tableView) { indexPath, dataSource, tableView -> UITableViewCell in
            let cell:TucaoCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TucaoCell
            let info = dataSource[indexPath.section][indexPath.row]
            
            print("imageurl = \(info.imageUrl)")
            
            cell.tucaoImageView.sd_setImageWithURL(NSURL(string: info.imageUrl))
            cell.tucao.text = info.tucao
            return cell
        }
    }
}
