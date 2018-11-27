//
//  CustomTableViewCell.swift
//  cardviewTry9
//
//  Created by Leon on 16/11/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    //@IBOutlet weak var lateralTag: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    
}
