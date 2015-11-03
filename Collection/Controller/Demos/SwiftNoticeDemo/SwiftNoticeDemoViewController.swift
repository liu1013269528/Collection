//
//  SwiftNoticeDemoViewController.swift
//  Collection
//
//  Created by 刘伟 on 15/10/30.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

class SwiftNoticeDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func actionSucess(sender: AnyObject) {
        successNotice("成功！", autoClear: true)
    }
    
    @IBAction func actionWait(sender: AnyObject) {
        var imagesArray = Array<UIImage>()
        for i in 1...7 {
            imagesArray.append(UIImage(named: "loading\(i)")!)
            self.pleaseWaitWithImages(imagesArray, timeInterval: 100)
        }
    }
    
    @IBAction func actionError(sender: AnyObject) {
        self.errorNotice("错误！", autoClear: true)
    }
    
    @IBAction func actionInfo(sender: AnyObject) {
        self.infoNotice("提示消息", autoClear: true)
    }
    
    @IBAction func actionOnlyText(sender: AnyObject) {
        self.noticeOnlyText("这是一个文字的提示框")
    }
    
    //状态栏提示
    @IBAction func actionStateBar(sender: AnyObject) {
        self.noticeTop("密码错误重试")
    }
    
    
    
    
    
    
    //清除所有的提示
    @IBAction func actionClear(sender: AnyObject) {
        self.clearAllNotice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
