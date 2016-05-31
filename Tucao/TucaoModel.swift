//
//  TucaoModel.swift
//  Tucao
//
//  Created by user on 2016/05/31.
//  Copyright © 2016年 kaka. All rights reserved.
//

import Foundation
import Alamofire
import Bond

class TucaoModel {
    let UrlTucao = "http://myreader.main.jp/TucaoService.php"
    var items = ObservableArray<TucaoInfo>()
    
    func getTucaoInfo() {
        items.removeAll()
        Alamofire.request(.GET,UrlTucao)
            .validate()
            .responseJSON { response in
                if (response.result.isFailure) {
                    print("failed.")
                    return
                }
                
                let jsonArray = response.result.value as! NSArray
                for array in jsonArray {
                    let resultArray = array as! NSArray
                    let url = resultArray[0] as! String
                    let name = resultArray[1] as! String
                    let tucao = resultArray[2] as! String
                    let favorate = resultArray[3] as! String
                    let tucaoTime = resultArray[4] as! String
                    
                    let tucaoInfo = TucaoInfo(tucao: tucao, imageUrl: url, userName: name, tucaoTime: tucaoTime, favorate: favorate)
                    self.items.append(tucaoInfo)
                }
        }
    }
}
