//
//  ZWSecondViewController.swift
//  Collection
//
//  Created by 刘伟 on 15/11/2.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit


typealias sendValueClosure = (tag: Int,string: String) -> Void

class LWSecondViewController: UIViewController {
    
    //声明一个闭包
    private var myClosure: sendValueClosure?
    private var myTag: Int?
    //下面的方法需要传入上个界面的someFunctionThatAClosure函数指针
    func initWithClosure(tag: Int,closuer: sendValueClosure?) {
        //讲函数指针赋值给myClosure闭包，该闭包中覆盖了someFunctionThatTakesAClosure函数中的局部变量等引用
        myTag = tag
        
        myClosure = closuer
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let btn = UIButton()
        btn.frame = CGRectMake(0, 100, 320, 50)
        btn.setTitle("点击我", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("action"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func action() {
        //判断是否为空
        if let closure = self.myClosure {
            closure(tag: self.myTag!,string: "Tag:\(self.myTag)")
        }
        self.dismissViewControllerAnimated(true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
