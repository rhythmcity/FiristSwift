//
//  SeaLifeView.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-5.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation
class SeaLifeView: UIView {
     var  imageview:UIImageView?
     var _currentWaterColor:UIColor?
     var _currentLinePointY:CGFloat = 0.0
     var a:CGFloat = 0.0
     var b:CGFloat = 0.0
     var jia:Bool = false
     var leftx:CGFloat = 0.0
     var lefty:CGFloat = 0.0
     var rightx:CGFloat = 0.0
     var righty:CGFloat = 0.0
     var up:Bool = false
    var player:AVAudioPlayer?
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        self.backgroundColor=UIColor.whiteColor()
        _currentWaterColor = UIColor(red:187/255.0 ,green:255/255.0 ,blue:255/255.0, alpha:1)
        _currentLinePointY = 250;
        
        NSTimer.scheduledTimerWithTimeInterval(0.02, target :  self, selector:  "sealifeAnimation", userInfo: nil, repeats : true)
        let path = NSBundle.mainBundle().pathForResource("seaandBird", ofType: "mp3")
       
        var error : NSError?
        self.player = AVAudioPlayer(contentsOfURL:NSURL.URLWithString(path), error:&error)
         println(self.player)
        println (error.description)
        self.player!.numberOfLoops = -1
        //[playerError description]
        // self.player!.prepareToPlay()
        if self.player!.prepareToPlay(){

        self.player!.play()
        }
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
        
        
        if  up {
            leftx = leftx + 0.1
            lefty = lefty - 0.1
            rightx = rightx - 0.2
            righty = righty - 0.2
        
        }else{
           leftx = leftx - 0.1
           lefty = lefty + 0.1
           rightx = rightx + 0.2
           righty = righty + 0.2
        }
        if leftx > 1{
        
           up = false
        }
        
        if  leftx < -5 {
        
            up = true
        }
        
        setNeedsDisplay()
        
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        var context = UIGraphicsGetCurrentContext() as CGContextRef;
        var path = CGPathCreateMutable() as CGMutablePathRef;
    
        CGContextSetLineWidth(context, 3.0);//线的
        CGContextMoveToPoint(context, 30+leftx, 160+lefty);//开始坐标p1
        //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
        //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
        CGContextAddArcToPoint(context, 50, 170, 55, 230, 15);
        CGContextStrokePath(context);//绘画路径

        CGContextMoveToPoint(context, 50, 180);//开始坐标p1
        //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
        //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
        CGContextAddArcToPoint(context, 60, 140, 80+rightx, 140+righty, 15);
        CGContextStrokePath(context);//绘画路径

        
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
