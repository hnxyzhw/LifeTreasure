//
//  TableViewCell.swift
//  LifeTreasure
//
//  Created by andson-zhw on 17/3/10.
//  Copyright © 2017年 zhw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var titleLab:UILabel!
    var iconimageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if !self.isEqual(nil) {
            self.setUI()
        }
    }
    
    func setUI(){
        let screenw = UIScreen.main.bounds.size.width
        titleLab = UILabel(frame: CGRect(x: 40, y: 0, width: screenw-80, height:20))
        titleLab.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(titleLab)
        iconimageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 30, height:30))
        iconimageView.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(iconimageView)
        
    }

}
