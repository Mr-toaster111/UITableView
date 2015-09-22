//
//  CustomCell.swift
//  UITableViewExample
//
//  Created by mathieu on 22/09/2015.
//  Copyright © 2015 gueroult. All rights reserved.
//

import Foundation
import UIKit

class CustomCell : UITableViewCell{



    var labelNom : UILabel!
    var labelDate : UILabel!
    var labelTotal : UILabel!
    var switchButton : UISwitch!
    var margin :CGFloat!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        labelTotal = UILabel()
        labelTotal.textAlignment = NSTextAlignment.Right
        contentView.addSubview(labelTotal)

        labelNom = UILabel()
        contentView.addSubview(labelNom)

        labelDate = UILabel()
        contentView.addSubview(labelDate)

        switchButton = UISwitch()
        contentView.addSubview(switchButton)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()


         self.accessoryView = switchButton


    }

    
}
