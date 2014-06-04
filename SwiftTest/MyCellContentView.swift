//
//  MyCellContentView.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-4.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit

class MyCellContentView: UIView {
    var image:UIImage?
    var name:NSString?
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
       self.backgroundColor=UIColor.whiteColor()
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
      self.image!.drawInRect(CGRectMake(10, 10, 80, 80))
      self.name!.drawInRect(CGRectMake(120, 10, 180, 40), withAttributes :[NSFontAttributeName:UIFont.systemFontOfSize(18), NSForegroundColorAttributeName:UIColor.darkGrayColor()])
        
    }
    


}
