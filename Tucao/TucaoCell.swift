//
//  TucaoCell.swift
//  Tucao
//
//  Created by user on 2016/05/31.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TucaoCell: UITableViewCell {
    var tucaoImageView = UIImageView()
    var tucao = UILabel()
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Tucao image.
        tucaoImageView.frame = CGRectMake(0, 0, screenWidth, 180)
        tucaoImageView.contentMode = .ScaleAspectFit
        tucaoImageView.clipsToBounds = true
        
        // Tucao text.
        tucao.frame = CGRectMake(0, CGRectGetMaxY(tucaoImageView.frame), screenWidth, 20)
        tucao.textAlignment = .Center
//        tucao.numberOfLines = 0
//        tucao.sizeToFit()
        
        self.addSubview(tucaoImageView)
        self.addSubview(tucao)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tucaoImageView.image = nil
        bnd_bag.dispose()
    }
}
