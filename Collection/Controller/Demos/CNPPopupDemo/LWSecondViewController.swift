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
    
    private let cellId = "DemoListID"
    
    //声明一个闭包
    private var myClosure: sendValueClosure?
    private var myTag: Int?
    private var dataList = [String]()
    //下面的方法需要传入上个界面的someFunctionThatAClosure函数指针
    func initWithClosure(tag: Int,dataList: [String],closuer: sendValueClosure?) {
        //讲函数指针赋值给myClosure闭包，该闭包中覆盖了someFunctionThatTakesAClosure函数中的局部变量等引用
        self.myTag = tag
        self.dataList = dataList
        self.myClosure = closuer
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
        let tableList = UITableView(frame: CGRectMake(0, 30, self.view.frame.width, self.view.frame.height))
        let nib = UINib(nibName: "DemoListCell", bundle: nil) //Cell文件名
        tableList.registerNib(nib, forCellReuseIdentifier: cellId)
        tableList.delegate = self
        tableList.dataSource = self
        tableList.reloadData()
        self.view.addSubview(tableList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension LWSecondViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellId, forIndexPath: indexPath) as! DemoListCell
        //cell.cellImg.image = UIImage(named: powerData[indexPath.row][2])
        cell.cellLabel.text = self.dataList[indexPath.row]
        return cell
    }
    
}

extension LWSecondViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let index = indexPath.row
        let string = self.dataList[index]
        if let closure = self.myClosure {
            closure(tag: self.myTag!,string: string)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

