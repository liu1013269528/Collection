
import UIKit

class SnapkitViewController: UIViewController {

    var oldPassword: UITextField!
    var newPassword: UITextField!
    var confirmPassword: UITextField!
    var formView: UIView!
    var confirmButton:UIButton!
    
    var topConstraint: Constraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        self.title = "修改密码"
        self.view.backgroundColor = UIColor.redColor()
        //登录框背景
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.formView.backgroundColor = UIColor.whiteColor()
        self.formView.layer.cornerRadius = 5
        self.view.addSubview(self.formView)
        //最常规的设置模式
        self.formView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            //存储top属性
            self.topConstraint = make.top.equalTo(200).constraint
            make.height.equalTo(220)
            
        }
        
        //密码图
        let imgLock1 =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgLock1.image = UIImage(named:"iconfont-password")
        
        //密码图
        let imgLock2 =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgLock2.image = UIImage(named:"iconfont-password")
        
        //密码图
        let imgLock3 =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgLock3.image = UIImage(named:"iconfont-password")
        
        //旧密码输入框
        self.oldPassword = UITextField()
        self.oldPassword.delegate = self
        self.oldPassword.tag = 100
        self.oldPassword.placeholder = "请输入旧密码"
        self.oldPassword.layer.cornerRadius = 5
        self.oldPassword.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.oldPassword.layer.borderWidth = 0.5
        self.oldPassword.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        self.oldPassword.leftViewMode = UITextFieldViewMode.Always
        self.oldPassword.returnKeyType = UIReturnKeyType.Next
        
        //密码输入框左侧图标
        self.oldPassword.leftView!.addSubview(imgLock1)
        self.formView.addSubview(self.oldPassword)
        
        //布局
        self.oldPassword.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(30)
            make.top.equalTo(20)
            make.right.equalTo(-30)
            make.height.equalTo(44)
        }
        
        //新密码输入框
        self.newPassword = UITextField()
        self.newPassword.delegate = self
        self.newPassword.tag = 101
        self.newPassword.placeholder = "请输入新密码"
        self.newPassword.layer.cornerRadius = 5
        self.newPassword.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.newPassword.layer.borderWidth = 0.5
        self.newPassword.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        self.newPassword.leftViewMode = UITextFieldViewMode.Always
        self.newPassword.returnKeyType = UIReturnKeyType.Next
        
        //密码输入框左侧图标
        self.newPassword.leftView!.addSubview(imgLock2)
        self.formView.addSubview(self.newPassword)
        
        //布局
        self.newPassword.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(30)
            make.top.equalTo(self.oldPassword.snp_bottom).offset(20)
            make.right.equalTo(-30)
            make.height.equalTo(44)
        }
        
        //确认新密码输入框
        self.confirmPassword = UITextField()
        self.confirmPassword.delegate = self
        self.confirmPassword.tag = 102
        self.confirmPassword.placeholder = "请重复新密码"
        self.confirmPassword.layer.cornerRadius = 5
        self.confirmPassword.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.confirmPassword.layer.borderWidth = 0.5
        self.confirmPassword.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        self.confirmPassword.leftViewMode = UITextFieldViewMode.Always
        self.confirmPassword.returnKeyType = UIReturnKeyType.Done
        
        //密码输入框左侧图标
        self.confirmPassword.leftView!.addSubview(imgLock3)
        self.formView.addSubview(self.confirmPassword)
        
        //布局
        self.confirmPassword.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(30)
            make.top.equalTo(self.newPassword.snp_bottom).offset(20)
            make.right.equalTo(-30)
            make.height.equalTo(44)
        }
        
        self.confirmButton = UIButton()
        self.confirmButton.setTitle("确认修改", forState: UIControlState.Normal)
        self.confirmButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.confirmButton.layer.cornerRadius = 5
        self.confirmButton.backgroundColor = UIColor(colorLiteralRed: 0.99, green: 0.82, blue: 0.04, alpha: 1)
        self.view.addSubview(self.confirmButton)
        self.confirmButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.top.equalTo(self.formView.snp_bottom).offset(20)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension SnapkitViewController: UITextFieldDelegate {
    
    //输入框获取焦点开始编辑
    func textFieldDidBeginEditing(textField:UITextField)
    {
        let tag = textField.tag
        switch tag {
        case 100:
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(150)
                self.view.layoutIfNeeded()
            })
        case 101:
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(100)
                self.view.layoutIfNeeded()
            })
        case 102:
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(70)
                self.view.layoutIfNeeded()
            })
        default:
            print("error")
        }
    }
    
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        let tag = textField.tag
        switch tag {
        case 100:
            self.newPassword.becomeFirstResponder()
        case 101:
            //下一个
            self.confirmPassword.becomeFirstResponder()
        case 102:
            //收起键盘
            textField.resignFirstResponder()
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(200)
                self.view.layoutIfNeeded()
            })
        default:
            print(textField.text)
        }
        return true
    }
}

