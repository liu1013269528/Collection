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
    var btn: UIButton?

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
        
        btn = UIButton(frame: CGRectMake(0, 0, 100, 30))
        btn!.tag = 100
        btn!.center = CGPoint(x: self.view.center.x, y: 300)
        btn!.setTitle("确定", forState: UIControlState.Normal)
        btn!.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn!.addTarget(self, action: "click:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        
        
    }
    
    func getValue(sender: UITextField) {
        let tag = sender.tag
        let second = LWSecondViewController()
        second.initWithClosure(tag, closuer: getValueClosure)
        //self.navigationController?.pushViewController(second, animated: true)
        self.presentViewController(second, animated: true, completion: nil)
    }
    
    func getValueClosure(tag: Int,string: String) {
        let tf = self.view.viewWithTag(tag) as! UITextField
        tf.text = string
    }
    
    func click(sender: UIButton){
        print("点击了\(sender.tag)")
        getButton(sender.tag)
    }
    
    func getButton(tag: Int) {
        let newBtn = self.view.viewWithTag(tag) as! UIButton
        newBtn.setTitle("终于到你", forState: UIControlState.Normal)
        newBtn.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
