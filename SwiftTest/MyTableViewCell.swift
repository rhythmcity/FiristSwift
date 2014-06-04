//
//  MyTableViewCell.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-4.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func setcell(image:UIImage!, name:String!){
        var view = MyCellContentView(frame:CGRect(x: 0,y: 0,width: 320,height: 100))
        view.image = image
        view.name = name
        self.contentView.addSubview(view)
     
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
