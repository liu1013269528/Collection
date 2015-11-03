//
//  DemoListCell.swift
//  Collection
//
//  Created by 刘伟 on 15/10/30.
//  Copyright © 2015年 lawrence_liu. All rights reserved.
//

import UIKit

class DemoListCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellImg.layer.masksToBounds = true
        self.cellImg.layer.cornerRadius = 20.0
        self.cellImg.layer.borderWidth = 0.0
        self.cellImg.image = UIImage(named: "avatar.jpg")// Initialization code
        self.cellIcon.image = UIImage(named: "Next")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
