
import UIKit

class SCLAlertDemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SCL提示组件"
        // Do any additional setup after loading the view.
    }
    
    //成功提示框，主要展示了添加按钮，两种添加事件的方法
    @IBAction func actionSuccess(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        sclAlert.addButton("确定", target: self, selector: Selector("confirmButton"))
        sclAlert.addButton("取消") {
            print("点击了取消按钮")
        }
        sclAlert.showSuccess("恭喜你！", subTitle: "您中奖了！", closeButtonTitle: "完成", duration: 1.0, colorStyle: 0x22B573, colorTextButton: 0xFFFFFF)
    }
    
    //错误提示框，关闭按钮(closeButtonTitle) 可以为 nil 隐藏，延迟（duration）为0.0则不会自动消失,colorStyle与colorTextButton 的风格参数 为 16进制色彩
    @IBAction func actionError(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        let title = "错误"
        let subTitle = "你执行了错误的操作"
        sclAlert.showError(title, subTitle: subTitle, closeButtonTitle: nil, duration: 0.0, colorStyle: 0xC1272D, colorTextButton: 0xFFFFFF)
    }
    
    @IBAction func actionNotice(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        let title = "注意"
        let subTitle = "这里是一条注意的提示消息"
        sclAlert.showNotice(title, subTitle: subTitle, closeButtonTitle: nil, duration: 1.0, colorStyle: 0x727375, colorTextButton: 0xFFFFFF)
    }
    
    @IBAction func actionWarning(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        let title = "警告"
        let subTitle = "这里是一条注意的警告消息"
        sclAlert.showWarning(title, subTitle: subTitle, closeButtonTitle: "关闭", duration: 1.0, colorStyle: 0xFFD110, colorTextButton: 0x000000)
    }
    
    
    @IBAction func actionInfo(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        let title = "消息"
        let subTitle = "SCLAlert是一个提示框组件，使用siwft编写，拥有良好的动画以及不错的性能"
        sclAlert.showInfo(title, subTitle: subTitle)
    }
    
    
    //可以添加文本框
    @IBAction func actionEdit(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        let textField = sclAlert.addTextField("请输入内容")
        sclAlert.addButton("显示姓名") {
            print("你输入的内容是\(textField.text)")
        }
        let title = "编辑"
        let subTitle = "这里是一条注意的编辑消息"
        sclAlert.showEdit(title, subTitle: subTitle)
    }
    
    
    @IBAction func actionDIY(sender: AnyObject) {
        let sclAlert = SCLAlertView()
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.redColor()
        vc.view.frame = CGRectMake(0, 0, 100, 50)
        sclAlert.addChildViewController(vc)
        let title = "自定义"
        let subTitle = "本来以为可以添加ViewController，结果不能，目前能自定义的就是文本框，按钮，以及弹出框的风格"
        sclAlert.showEdit(title, subTitle: subTitle)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
