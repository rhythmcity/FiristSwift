//
//  YoungView.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-7.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit

class YoungView: UIView {
    var backimg:UIView?
    var forimg:UIView?
    var  p:CGFloat = 0.0
    let height:CGFloat = 533/2
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        self.backimg = buidlStarViewWithImageName("ly_back.png")
        self.forimg = buidlStarViewWithImageName("ly_fore.png")
        
        self.addSubview(self.forimg)
        self.addSubview(self.backimg)
        self.backgroundColor = UIColor.blackColor()
        NSTimer.scheduledTimerWithTimeInterval(0.02, target :  self, selector:  "changeStarForegroundView", userInfo: nil, repeats : true)

       // changeStarForegroundView()
        
    }
    
    func buidlStarViewWithImageName(imagename:NSString)->UIView
    {
    var frame = self.bounds
    var view = UIView(frame:frame)
    view.clipsToBounds = true
        
        
            var imageView = UIImageView(image:UIImage(named:imagename))
            imageView.contentMode = .ScaleAspectFill
            //imageView.layer.anchorPoint = CGPointMake(0,1)
          //  imageView.transform = CGAffineTransformMakeRotation(90.0*0.0174532925);
           // imageView.bounds = CGRectMake(0.0, 0.0, height, 200);
            imageView.frame = CGRectMake(40, 0, 200, height)
            view.addSubview(imageView)

        
    return view;
    }
    
    func changeStarForegroundView(){
        
       
      //  while  true{
        if (p < 0)
        {
            p = height
        }
        var score = p / height
        p  = score * height
        self.backimg!.frame = CGRectMake(-7.5, 0, 200 , p);
        
        p -= 3
      //  }
    
    
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
