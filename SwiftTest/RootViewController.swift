//
//  RootViewController.swift
//  SwiftTest
//
//  Created by 李言 on 14-6-3.
//  Copyright (c) 2014年 李言. All rights reserved.
//

import UIKit


class ViewController:UIViewController, UITableViewDelegate,UITableViewDataSource{

    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    var flowers:NSArray=["0","1","2","3","4","5","6","7","8","9","10"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var table:UITableView=UITableView(frame:CGRect(x: 0,y: 0,width: 320,height: 480),style:.Plain)
      //  table.backgroundColor=UIColor.redColor()
        table.delegate=self
        table.dataSource=self
        self.view.addSubview(table)
//
        //var btn:UIButton=UIButton.buttonWithType(.System) as UIButton
//      let btn =  UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//       btn.backgroundColor=UIColor.redColor()
//        btn.setTitle("Woah, press me!", forState: UIControlState.Normal)
//        btn.setImage(UIImage(named:"11-2.png"), forState : UIControlState.Normal)
//        btn.setImage(UIImage(named:"11-4.png"), forState : UIControlState.Selected)
    
//        btn.addTarget(self,  action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
//      //  btn.targetForAction( "btnClick:", withSender: self)
//        self.view.addSubview(btn)
        
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
    
      println("touches")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
    return  50
    
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
    return  self.flowers.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
    
        let sampleindetifie:String="sampleindetifie"

        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: sampleindetifie)
        
        cell.textLabel.text = self.flowers[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
    
       println(indexPath.row) 
       
        var detailvc:DetailViewController=DetailViewController(nibName: "DetailViewController",bundle: nil)
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
