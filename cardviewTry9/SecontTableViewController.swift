//
//  SecontTableViewController.swift
//  cardviewTry9
//
//  Created by Leon on 16/11/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit
import Foundation
struct cellData{
    let cell: Int!
    let title: String!
    let image: UIImage!
    let color: String!
}

class SecontTableViewController: UITableViewController {

    var arrayOfData = [cellData]()
    
    
    override func viewDidLoad() {
        arrayOfData = [cellData(cell: 1, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "red"),
        cellData(cell: 2, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "red"),cellData(cell: 3, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "green"),cellData(cell: 4, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "red"),cellData(cell: 5, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "green"),cellData(cell: 6, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "red"),cellData(cell: 7, title: "Panadol", image: #imageLiteral(resourceName: "screen"), color: "yellow")]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        cell.layer.cornerRadius = 14
        cell.layoutMargins = UIEdgeInsets(top: 25, left: 20, bottom: 25, right: 20)

        cell.typeImage.image = arrayOfData[indexPath.row].image
        cell.titleLable.text = arrayOfData[indexPath.row].title
        
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 8, height: 8)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        
        createLateralTag(color: arrayOfData[indexPath.row].color, cell: cell)
        
        //cell.lateralTag = UIView()
        //cell.lateralTag.frame = CGRect(x: 0, y: 0, width: 20, height: 149.5)
        
      /*  switch arrayOfData[indexPath.row].color {
        case "red":
            print("etiqueta roja ######")
            cell.lateralTag.backgroundColor = UIColor.red
        case "yellow":
            cell.lateralTag.backgroundColor = UIColor.yellow
        case "green":
            cell.lateralTag.backgroundColor = UIColor.green
        default:
            cell.lateralTag.backgroundColor = UIColor.lightGray
        }
        cell.layoutSubviews()
        */
        return cell
        
    }
    
    func createLateralTag(color : String, cell: CustomTableViewCell){
        let customTag = UIView()
        switch color {
        case "red":
            print("etiqueta roja ######")
            customTag.backgroundColor = UIColor.red
        case "yellow":
            customTag.backgroundColor = UIColor.yellow
        case "green":
            customTag.backgroundColor = UIColor.green
        default:
            customTag.backgroundColor = UIColor.lightGray
        }
        customTag.frame = CGRect(x: 0, y: 0, width: 20, height: 135)
        cell.addSubview(customTag)

        self.roundCorners(view: customTag, corners: [.bottomLeft, .topLeft], radius: 10.0)
        customTag.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
        //customTag.rightAnchor.constraint(equalTo: cell.messageView.leftAnchor).isActive = true
        customTag.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        customTag.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        //return customTag
    }
    
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = false
    }

    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    

}
