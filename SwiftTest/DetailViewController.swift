//
//  DetailViewController.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-4.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit
import QuartzCore

class DetailViewController: UIViewController {
    var  titlename:String?
    var  drawview: UIView?
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var device:UIDevice = UIDevice.currentDevice() as UIDevice
        println(device.systemVersion)
        var  version :NSString = device.systemVersion
        if version.doubleValue >= 7
        {
         self.edgesForExtendedLayout = UIRectEdge.None;
        }
        self.title=self.titlename
        self.drawview = DetailView(frame:self.view.frame)
        self.drawview!.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.drawview)
        setupView();
        
        
//        var animation :CABasicAnimation = CABasicAnimation(keyPath: "transform.scale") as CABasicAnimation
//        animation.fromValue=NSValue(CATransform3D : CATransform3DMakeScale(1, 1, 1))
//        animation.toValue=NSValue(CATransform3D : CATransform3DMakeScale(1.5, 1.5, 1.5))
//        animation.duration=1
//        drawview.layer.addAnimation(animation,forKey: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
