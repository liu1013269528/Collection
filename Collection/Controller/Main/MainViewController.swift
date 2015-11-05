
import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var demoList = UITableView()
    
    let cellId = "DemoListID"
    
    var tableData: (titles:[String], values:[String])?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
        self.view.backgroundColor = UIColor.whiteColor()
        
        //demoList的设置
        self.demoList.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        //self.demoList.separatorStyle = UITableViewCellSeparatorStyle.None
        let nib = UINib(nibName: "DemoListCell", bundle: nil) //Cell文件名
        self.demoList.registerNib(nib, forCellReuseIdentifier: cellId)
        self.demoList.delegate = self
        self.demoList.dataSource = self
        self.view.addSubview(self.demoList)
        self.showData()
        
    }
    
    func showData()
    {
        self.tableData = (["SLC提示组件", "SwiftNotice组件--JohnLui", "CNPPopup组件","闭包回调","页面跳转", "KLCPopup组件","Pitaya网络组件","Neon布局组件"], ["SCLAlert", "SwiftNotice", "CNPPopup","ClosureBack","ViewJump","","",""])
        self.demoList.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count:Int = self.tableData!.titles.count else {
            print("没有数据")
        }
        
        return count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellId, forIndexPath: indexPath) as! DemoListCell
        //cell.cellImg.image = UIImage(named: powerData[indexPath.row][2])
        cell.cellLabel.text = self.tableData!.titles[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let index = indexPath.row
        let storyID = tableData!.values[index] as String
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nextView:UIViewController
        switch storyID {
        case "SCLAlert":
            nextView = storyboard.instantiateViewControllerWithIdentifier(storyID) as! SCLAlertDemoViewController
        case "SwiftNotice":
            nextView = storyboard.instantiateViewControllerWithIdentifier(storyID) as! SwiftNoticeDemoViewController
        case "CNPPopup":
            nextView = storyboard.instantiateViewControllerWithIdentifier(storyID) as! CNPPopupDemoViewController
        case "ClosureBack":
            nextView = LWRootViewController()
        case "ViewJump":
            nextView = storyboard.instantiateViewControllerWithIdentifier("ViewJump") as! ViewJumpViewController
        default:
            nextView = storyboard.instantiateViewControllerWithIdentifier("SCLAlert") as! SCLAlertDemoViewController
        }
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
