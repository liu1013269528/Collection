//
//  ZWRootViewController.swift
//  Collection
//
//  Created by 刘伟 on 15/11/2.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

class LWRootViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textFieldWithTagOne: UITextField?
    var textFieldWithTagTwo: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        //通过tag获取控件
        textFieldWithTagOne = UITextField(frame: CGRectMake(0, 0, 150,30))
        textFieldWithTagOne!.center = CGPoint(x: self.view.center.x, y: 100)
        textFieldWithTagOne!.backgroundColor = UIColor.grayColor()
        textFieldWithTagOne!.tag = 1
        textFieldWithTagOne!.addTarget(self, action: "getValue:", forControlEvents: UIControlEvents.EditingDidBegin)
        self.view.addSubview(textFieldWithTagOne!)
        
        textFieldWithTagTwo = UITextField(frame: CGRectMake(0, 0, 150,30))
        textFieldWithTagTwo!.center = CGPoint(x: self.view.center.x, y: 200)
        textFieldWithTagTwo!.backgroundColor = UIColor.grayColor()
        textFieldWithTagTwo!.tag = 2
        textFieldWithTagTwo!.addTarget(self, action: "getValue:", forControlEvents: UIControlEvents.EditingDidBegin)
        self.view.addSubview(textFieldWithTagTwo!)
        
        
    }
    
    func getValue(sender: UITextField) {
        let tag = sender.tag
        let second = LWSecondViewController()
        second.initWithClosure(tag, dataList: ["我是选项1", "我是选项2", "我是选项3", "我是选项4", "我是选项5", "我是选项6"], closuer: getValueClosure)
        //self.navigationController?.pushViewController(second, animated: true)
        self.presentViewController(second, animated: true, completion: nil)
    }
    
    func getValueClosure(tag: Int,string: String) {
        let tf = self.view.viewWithTag(tag) as! UITextField
        tf.text = string
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
