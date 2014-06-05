//
//  RootViewController.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-3.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit


class RootViewController:UIViewController, UITableViewDelegate,UITableViewDataSource{

    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    var flowers:NSMutableArray=[]
    var nameArr:NSMutableArray=[]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var table:UITableView=UITableView(frame:self.view.frame,style:.Plain)
      //  table.backgroundColor=UIColor.redColor()
        table.delegate=self
        table.dataSource=self
        self.view.addSubview(table)
        
        for index in 1..10{
        self.flowers.addObject("\(index).jpg")
        }
    
//        for index in 1..9{
            self.nameArr=["爱情万岁","人生海海","第一张创作专辑","神的孩子都在跳舞","为爱而生","知足","后青春期的诗","第二人生(末日版)","第二人生(明日版)"]
//        }
    
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
    
      println("touches")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
    return  100
    
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
    return  self.flowers.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
    
        let sampleindetifie:String="sampleindetifie"
        let  cell = MyTableViewCell(style: .Subtitle, reuseIdentifier: sampleindetifie)
        var str = self.flowers[indexPath.row] as String
        cell.setcell(UIImage(named: str),name:self.nameArr[indexPath.row] as String)
        return cell
        
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
    
       println(indexPath.row) 
       
        var detailvc:DetailViewController=DetailViewController(nibName: "DetailViewController",bundle: nil)
        detailvc.titlename=self.nameArr[indexPath.row] as? String
        self.navigationController.pushViewController(detailvc, animated: true)
    }
    
   
   
    func btnClick(sender: UIButton!){
    var btn:UIButton=sender
    btn.selected = !btn.selected
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
