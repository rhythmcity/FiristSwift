//
//  FirstAblumView.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-5.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit

class FirstAblumView: UIView {

    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        self.backgroundColor = UIColor.whiteColor()
    }

    let PI:Float =  3.14159265358979323846
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
         var context = UIGraphicsGetCurrentContext() as CGContextRef;
        CGContextSetRGBStrokeColor(context,1,1,0,1.0);//画笔线的颜色
        CGContextSetLineWidth(context, 1.0);//线的宽度
//    
//        CGContextAddArc(context, 100, 20, 15, 0, 2*PI, 0); //添加一个圆
//        CGContextDrawPath(context, kCGPathStroke); //绘制路径
//        //填充圆，无边框
//        CGContextAddArc(context, 150, 30, 30, 0, 2*PI, 0); //添加一个圆
//        CGContextDrawPath(context, kCGPathFill);//绘制填充
//        //画大圆并填充颜
        var aColor=UIColor(red: 1, green: 0.0, blue: 0, alpha: 1)
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(context, 3.0);//线的宽度
        CGContextAddArc(context, 160, 200, 100, 0, 2*PI, 0); //添加一个圆
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
        
        CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);//改变画笔颜色
        CGContextMoveToPoint(context, 80, 170);//开始坐标p1
        //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
        //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
        CGContextAddArcToPoint(context, 110, 140, 140, 170, 40);
        CGContextStrokePath(context);//绘画路径
        
        //右
        CGContextMoveToPoint(context, 180, 170);//开始坐标p1
        //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
        //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
        CGContextAddArcToPoint(context, 210, 140, 240, 170, 40);
        CGContextStrokePath(context);//绘画路径
        
        //右
        CGContextMoveToPoint(context, 130, 230);//开始坐标p1
        //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
        //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
        CGContextAddArcToPoint(context, 160, 260, 190, 230, 40);
        CGContextStrokePath(context);//绘画路径
        
    }


}
