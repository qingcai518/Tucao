//
//  TucaoInfo.swift
//  Tucao
//
//  Created by user on 2016/05/31.
//  Copyright © 2016年 kaka. All rights reserved.
//

import Foundation

class TucaoInfo {
    var tucao:String!
    var imageUrl:String!
    var userName:String!
    var tucaoTime:String!
    var favorate:String!
    
    init(tucao:String, imageUrl:String, userName:String, tucaoTime:String, favorate:String) {
        self.tucao = tucao
        self.imageUrl = imageUrl
        self.userName = userName
        self.tucaoTime = tucaoTime
        self.favorate = favorate
    }
}