

import UIKit

class CNPPopupDemoViewController: UIViewController,CNPPopupControllerDelegate {


    @IBOutlet weak var content: UIButton!
    @IBOutlet weak var selectContent: UIButton!
    var popupController = CNPPopupController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.content.tag = 1
        self.selectContent.tag = 2
        self.content.addTarget(self, action: "sendValue:", forControlEvents: UIControlEvents.TouchUpInside)
        self.selectContent.addTarget(self, action: "popTableList:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func sendValue(sender: UITextField) {
        let presentContent = self.view.viewWithTag(sender.tag) as! UIButton
        let presentString = presentContent.titleLabel?.text
        showPop(sender.tag, string: presentString, popupStyle: CNPPopupStyle.Centered)
    }
    
    func showPop(tag: Int,string: String?, popupStyle: CNPPopupStyle){
        let label1 = labelFormat("请输入下面内容", labelFont: 24)
        
        let customView = UIView(frame: CGRectMake(0, 0, 250, 55))
        customView.backgroundColor = UIColor.lightGrayColor()
        let textField = UITextField(frame: CGRectMake(10, 10, 230, 35))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.placeholder = "请输入内容"
        textField.text = string
        textField.returnKeyType = UIReturnKeyType.Done
        customView.addSubview(textField)
        
        let btn = CNPPopupButton(frame: CGRectMake(0, 0, 200, 60))
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        btn.setTitle("关闭", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor(red: 0.46, green: 0.8, blue: 1.0, alpha: 1.0)
        btn.layer.cornerRadius = 4
        btn.selectionHandler = {(btn) in
            let newString = textField.text
            self.getValue(tag, newString: newString)
            self.popupController.dismissPopupControllerAnimated(true)
        }
        
        self.popupController = CNPPopupController(contents: [label1,customView,btn])
        self.popupController.theme = CNPPopupTheme.defaultTheme()
        self.popupController.theme.popupStyle = popupStyle
        self.popupController.delegate = self
        self.popupController.presentPopupControllerAnimated(true)
        
        textField.becomeFirstResponder()

    }
    
    func getValue(tag: Int, newString: String?) {
        let getTextField = self.view.viewWithTag(tag) as! UIButton
        getTextField.setTitle(newString, forState: UIControlState.Normal)
    }
    
    
    func popTableList(sender: AnyObject) {
        let popList = TableListPopup(dataList: ["项目一", "项目二", "项目三", "项目四", "项目五", "项目六", "项目七"], popStype: .Centered, tag: sender.tag, myClosure: getSelectValue)
        self.popupController = popList.initListPopupControllers()
        self.popupController.delegate = self
        self.popupController.presentPopupControllerAnimated(true)
    }
    
    func getSelectValue(tag: Int, string: String) {
        let presentBtn = self.view.viewWithTag(tag) as! UIButton
        presentBtn.setTitle(string, forState: UIControlState.Normal)
    }
    
    
    func showPopupWithStyle(popupStyle: CNPPopupStyle) {
        
        let label1 = labelFormat("这是一个Popup", labelFont: 24)
        let label2 = labelFormat("你可以添加文字或图片", labelFont: 18)
        
        let btn = CNPPopupButton(frame: CGRectMake(0, 0, 200, 60))
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        btn.setTitle("关闭", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor(red: 0.46, green: 0.8, blue: 1.0, alpha: 1.0)
        btn.layer.cornerRadius = 4
        btn.selectionHandler = {(btn) in
            let title = btn.titleLabel?.text
            print(title)
            self.popupController.dismissPopupControllerAnimated(true)
        }
        
        let customView = UIView(frame: CGRectMake(0, 0, 250, 55))
        customView.backgroundColor = UIColor.lightGrayColor()
        let textFeild = UITextField(frame: CGRectMake(10, 10, 230, 35))
        textFeild.borderStyle = UITextBorderStyle.RoundedRect
        textFeild.placeholder = "自定义VIEW"
        customView.addSubview(textFeild)
        
        self.popupController = CNPPopupController(contents: [label1,label2,customView,btn])
        self.popupController.theme = CNPPopupTheme.defaultTheme()
        self.popupController.theme.popupStyle = popupStyle

        self.popupController.delegate = self
        self.popupController.presentPopupControllerAnimated(true)
        
    }
    
    func labelFormat(labelTitle: String,labelFont: CGFloat,labelColor:UIColor = UIColor.whiteColor()) -> UILabel {
        let labelDemo = UILabel()
        labelDemo.text = labelTitle
        labelDemo.font = UIFont.boldSystemFontOfSize(labelFont)
        labelDemo.textAlignment = NSTextAlignment.Center
        labelDemo.lineBreakMode = NSLineBreakMode.ByWordWrapping
        labelDemo.backgroundColor = labelColor
        return labelDemo
        
    }
    
    
    
    @IBAction func actionFormsheet(sender: AnyObject) {
        showPopupWithStyle(CNPPopupStyle.ActionSheet)
    }
    
    
    @IBAction func actionCentered(sender: AnyObject) {
        showPopupWithStyle(CNPPopupStyle.Centered)
    }
    
    
    
    @IBAction func actionFullscreen(sender: AnyObject) {
        showPopupWithStyle(CNPPopupStyle.Fullscreen)
    }
    
    //CNPopupDelegate
    func popupControllerDidDismiss(controller: CNPPopupController!) {
        print("关闭")
    }
    
    func popupControllerDidPresent(controller: CNPPopupController!) {
        print("打开")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CNPPopupDemoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //收起键盘
        textField.resignFirstResponder()
        print(textField.text)
        return true;
    }
}
