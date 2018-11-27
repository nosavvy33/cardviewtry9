//
//  ViewController.swift
//  cardviewTry9
//
//  Created by leon on 11/9/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit

struct CellData{
    let image : UIImage?
    let message : String?
}

class TableViewController: UITableViewController {

    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [CellData.init(image: UIImage(named: "red_line"), message: "Helloworzxxzxzxzxzxxzxzxzxzxzxzxzzxxzzxzld"),CellData.init(image: UIImage(named: "screen"), message: "HelloHow to make UITableViewCells auto resize to their content - free Swift 4.2 example code and tips"),CellData.init(image: UIImage(named: "screen"), message: "HeHow to make UITableViewCells auto resize to their content - free Swift 4.2 example code and tipsllo world"),CellData.init(image: UIImage(named: "screen"), message: "Hello worlHow to make UITableViewCells auto resize to their content - free Swift 4.2 example code and tipsd"),CellData.init(image: UIImage(named: "screen"), message: "Hello How to make UITableViewCells auto resize to their content - free Swift 4.2 example code and tipsworld"),CellData.init(image: UIImage(named: "screen"), message: "Hello How to make UITableViewCells auto resize to their content - free Swift 4.2 example code and tipsworld")]
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        //self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = 150
        self.tableView.estimatedRowHeight = 150
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.img = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = false
    }


}

