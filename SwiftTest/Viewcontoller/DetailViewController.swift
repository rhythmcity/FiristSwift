//
//  DetailViewController.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-4.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit
import QuartzCore

class DetailViewController: UIViewController,NSURLConnectionDelegate {
    var  titlename:String?
    var  drawview: DetailView?
    var receiveData:NSMutableData?
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
        let  name = self.titlename!
        switch name {
        case "人生海海":
        var sealife = SeaLifeView(frame:self.view.frame)
        self.view.addSubview(sealife)
        case  "第一张创作专辑" :
        var firstablum = FirstAblumView(frame:self.view.frame)
        self.view.addSubview(firstablum)
     
        default:
            self.drawview = DetailView(frame:self.view.frame)
            self.drawview!.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(self.drawview)
            loadData("http://www.baidu.com")
        }
        
     
        
     
      
        
        
//        var animation :CABasicAnimation = CABasicAnimation(keyPath: "transform.scale") as CABasicAnimation
//        animation.fromValue=NSValue(CATransform3D : CATransform3DMakeScale(1, 1, 1))
//        animation.toValue=NSValue(CATransform3D : CATransform3DMakeScale(1.5, 1.5, 1.5))
//        animation.duration=1
//        drawview.layer.addAnimation(animation,forKey: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(url:String!){
        var requset:NSMutableURLRequest = NSMutableURLRequest(URL:NSURL((string:url)))
       requset.HTTPMethod = "GET"
       
        var connection = NSURLConnection(request:requset, delegate: self)

        connection.start()
        
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
        var res = response as NSHTTPURLResponse;
       
        self.receiveData = NSMutableData()
    
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
      self.receiveData!.appendData(data)
    
    }
    
     func connectionDidFinishLoading(connection: NSURLConnection!)
     {
      var receiveStr = NSString(data: self.receiveData, encoding: NSUTF8StringEncoding)
        
        
      self.drawview!.content = receiveStr
        
      self.drawview!.setNeedsDisplay()
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
