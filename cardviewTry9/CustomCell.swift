//
//  CustomCell.swift
//  cardviewTry9
//
//  Created by leon on 11/11/18.
//  Copyright © 2018 leon. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    var message: String?
    var img: UIImage?
    
    var messageView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.layoutMargins.top = 50
        textView.layoutMargins.left = 50
        textView.backgroundColor = UIColor.red
        textView.tintColor = UIColor.red
        return textView
    }()
    
    var mainImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    var rectangle : UIView = {
        let rectangl = UIView()
        rectangl.frame = CGRect(x: 0, y: 0, width: 20, height: 135)
        
        rectangl.backgroundColor = UIColor.red
       // rectangl.layer.cornerRadius = 10
        // Add gradient
        /*let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rectangl.bounds
        
        let color1 = UIColor.red.cgColor*/
        /*let color2 = UIColor.red.cgColor
        let color3 = UIColor.clear.cgColor
        let color4 = UIColor.white.cgColor*/
        
     /*  gradientLayer.colors = [color1]
        gradientLayer.locations = [1.0]
        rectangl.layer.addSublayer(gradientLayer)*/
        
        // Add corner radius
      //  gradientLayer.cornerRadius = 10
        return rectangl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(messageView)
        self.addSubview(rectangle)

        //self.addSubview(mainImageView)
       // self.addSubview(mainImageView)
        
      //  mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
       
        
        /* WORKS FINE
         mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.messageView.topAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true*/
        
       /* mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: self.messageView.leftAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        mainImageView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)*/
        
        //mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
      /*  mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true*/
        
        self.roundCorners(view: self.rectangle, corners: [.bottomLeft, .topLeft], radius: 10.0)

        
        rectangle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        rectangle.rightAnchor.constraint(equalTo: self.messageView.leftAnchor).isActive = true
        rectangle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rectangle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        /* WORKS FINE*/
         messageView.leftAnchor.constraint(equalTo: self.rectangle.rightAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        
        
        // Add the label to your rectangle
        
        //messageView.textContainerInset = UIEdgeInsets(top: 0, left: 15, bottom: 20, right: 15)
        //graph()
        backgroundColor = UIColor(hexString: "#ff0000")
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowColor = UIColor.lightGray.cgColor
        
        contentView.backgroundColor = UIColor(hexString: "#ff0000")
        contentView.layer.cornerRadius = 10
        
        contentView.layoutMargins = UIEdgeInsets(top: 25, left: 20, bottom: 25, right: 20)
        
        messageView.backgroundColor = contentView.backgroundColor
        messageView.tintColor = contentView.backgroundColor
        
        /*messageView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.mainImageView.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true*/
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = message {
            messageView.text = message
        }
        if let image = img {
            mainImageView.image = image
        }
    }
    
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
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
}
