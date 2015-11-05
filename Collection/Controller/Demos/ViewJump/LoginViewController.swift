//
//  LoginViewController.swift
//  Collection
//
//  Created by 刘伟 on 15/11/5.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private var tag:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initWithParams(tag:Int) {
        self.tag = tag
    }
    
    
    @IBAction func back(sender: AnyObject) {
        if let t = self.tag {
            switch (t) {
            case 1:
                self.navigationController?.popViewControllerAnimated(true)
//                self.navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
//                self.navigationController?.popToRootViewControllerAnimated(true)
            case 2:
                self.dismissViewControllerAnimated(true, completion: nil)
            default:
                print("something wrong")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
