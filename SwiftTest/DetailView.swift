//
//  DetailView.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-4.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit

class DetailView: UIView {

    var content :NSString?
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {

        
        var image=UIImage(named:"11-2.png")
        image.drawInRect(CGRectMake(20, 10, 40, 40))
        if let recveivestr = self.content
        {
        self.content!.drawInRect(CGRectMake(20, 60, 280, 1000), withAttributes :[NSFontAttributeName:UIFont.systemFontOfSize(18), NSForegroundColorAttributeName:UIColor.darkGrayColor()])
        }

        // Drawing code
    }
    

}
