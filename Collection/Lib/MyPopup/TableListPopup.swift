//
//  TableListPopup.swift
//  Collection
//
//  Created by 刘伟 on 15/11/4.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

typealias getValueClosure = (tag: Int,string: String) -> Void
class TableListPopup:CNPPopupController {
    
    var popupController = CNPPopupController()
    private let cellId = "DemoListID"
    private var dataList: [String]
    private var popStype: CNPPopupStyle
    private var tag: Int
    private var myClosure: getValueClosure?
    
    
    
    
    init(dataList: [String]?,popStype:CNPPopupStyle,tag: Int, myClosure: getValueClosure?) {
        if let data = dataList {
            self.dataList = data
        }else{
            self.dataList = ["Null"]
        }
        self.popStype = popStype
        self.tag = tag
        self.myClosure = myClosure
        super.init()
    }
    
    func initListPopupControllers() ->CNPPopupController {
        //标题
        let title = labelFormat("请选择下面内容", labelFont: 18)
        
        //ContentView: 列表页
        let contentView = UIView(frame: CGRectMake(0, 0, 250, 100))
        let tableList = UITableView(frame: contentView.frame)
        
        let nib = UINib(nibName: "DemoListCell", bundle: nil) //Cell文件名
        tableList.registerNib(nib, forCellReuseIdentifier: cellId)
        tableList.delegate = self
        tableList.dataSource = self
        tableList.reloadData()
        contentView.addSubview(tableList)
        
        //创建确认按钮
        let confirmBtn = CNPPopupButton(frame: CGRectMake(0, 0, 100, 40))
        confirmBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        confirmBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        confirmBtn.setTitle("关闭", forState: UIControlState.Normal)
        confirmBtn.backgroundColor = UIColor(red: 0.46, green: 0.8, blue: 1.0, alpha: 1.0)
        confirmBtn.layer.cornerRadius = 4
        confirmBtn.selectionHandler = {(btn) in
            self.popupController.dismissPopupControllerAnimated(true)
        }

        self.popupController = CNPPopupController(contents: [title,contentView,confirmBtn])
        self.popupController.theme = CNPPopupTheme.defaultTheme()
        self.popupController.theme.popupStyle = self.popStype
        
        return popupController
    }
    
    func labelFormat(labelTitle: String,labelFont: CGFloat,labelColor:UIColor = UIColor.whiteColor()) -> UILabel {
        let formatLabel = UILabel()
        formatLabel.text = labelTitle
        formatLabel.font = UIFont.boldSystemFontOfSize(labelFont)
        formatLabel.textAlignment = NSTextAlignment.Center
        formatLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        formatLabel.backgroundColor = labelColor
        return formatLabel
    }

}

extension TableListPopup: UITableViewDataSource {
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

extension TableListPopup: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let index = indexPath.row
        let string = self.dataList[index]
        if string == "Null" {
            self.popupController.dismissPopupControllerAnimated(true)
        }
        if let closure = self.myClosure {
            closure(tag: self.tag, string: string)
            self.popupController.dismissPopupControllerAnimated(true)
        }
        self.popupController.dismissPopupControllerAnimated(true)
    }
}
