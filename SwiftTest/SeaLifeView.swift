//
//  SeaLifeView.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-5.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit
import QuartzCore
class SeaLifeView: UIView {
     var  imageview:UIImageView?
     var _currentWaterColor:UIColor?
     var _currentLinePointY:CGFloat = 0.0
     var a:CGFloat = 0.0
     var b:CGFloat = 0.0
     var jia:Bool = false
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        self.backgroundColor=UIColor.whiteColor()
        _currentWaterColor = UIColor(red:86/255.0 ,green:202/255.0 ,blue:139/255.0, alpha:1)
        _currentLinePointY = 250;
        
        NSTimer.scheduledTimerWithTimeInterval(0.02, target :  self, selector:  "sealifeAnimation", userInfo: nil, repeats : true)
    // sealifeAnimation()
        
        
    }
    func sealifeAnimation(){
        
//        self.imageview = UIImageView(image:UIImage(named:"sea.jpg"))
//        self.addSubview(self.imageview)
//        var animation :CABasicAnimation = CABasicAnimation(keyPath: "transform.scale") as CABasicAnimation
//        animation.fromValue=NSValue(CATransform3D : CATransform3DMakeScale(1, 1, 1))
//        animation.toValue=NSValue(CATransform3D : CATransform3DMakeScale(1.5, 1.5, 1.5))
//        animation.duration=1
//        self.layer.addAnimation(animation,forKey: nil)
        if jia {
            a = a + 0.01
        }else{
            a = a - 0.01
        }
        
        
        if a<=1 {
            jia = true
        }
        
        if a>=1.5 {
            jia = false
        }
        
        
        b = b + 0.1
        
        setNeedsDisplay()
        
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        var context = UIGraphicsGetCurrentContext() as CGContextRef;
        var path = CGPathCreateMutable() as CGMutablePathRef;
        
        //画水
        CGContextSetLineWidth(context, 1);
        CGContextSetFillColorWithColor(context, _currentWaterColor!.CGColor);
        
        var y = _currentLinePointY;
        CGPathMoveToPoint(path, nil, 0, _currentLinePointY);
        var x:CGFloat=0.0
        for index in 0..321{
            x++
            y = a * sin((x/180*M_PI) + (4*b/M_PI)) * 5 + _currentLinePointY;
            CGPathAddLineToPoint(path, nil, x, y);
        }
        CGPathAddLineToPoint(path, nil, 320, rect.size.height);
        CGPathAddLineToPoint(path, nil, 0, rect.size.height);
        CGPathAddLineToPoint(path, nil, 0, _currentLinePointY)
        CGContextAddPath(context, path);
        CGContextFillPath(context);
        CGContextDrawPath(context, kCGPathStroke);
        CGPathRelease(path);

        
        
    }


}
