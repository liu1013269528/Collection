//
//  ViewJumpViewController.swift
//  Collection
//
//  Created by 刘伟 on 15/11/5.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

class ViewJumpViewController: UIViewController {
   
    @IBOutlet weak var naviJump: UIButton!
    @IBOutlet weak var viewJump: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviJump.tag = 1
        self.viewJump.tag = 2
        
        self.naviJump.addTarget(self, action: "jump:", forControlEvents: .TouchUpInside)
        self.viewJump.addTarget(self, action: "jump:", forControlEvents: .TouchUpInside)
    }
    
    func jump(sender: AnyObject?) {
        if let ob = sender {
            let tag = ob.tag
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginView = storyboard.instantiateViewControllerWithIdentifier("LoginView") as! LoginViewController
            loginView.initWithParams(tag)
            switch (tag) {
                case 1:
                    print("我的tag是：\(tag)")
                    
                    self.navigationController?.pushViewController(loginView, animated: true)
                case 2:
                    print("我的tag是：\(tag)")
                    self.presentViewController(loginView, animated: true, completion: nil)
                default:
                    print("有多余的东西触发了事件")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
