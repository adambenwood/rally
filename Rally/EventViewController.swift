//
//  EventViewController.swift
//  Rally
//
//  Created by Adam Benwood on 2018-03-08.
//  Copyright © 2018 Adam Benwood. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    

    @IBOutlet var tableView: UITableView!
    
    
    
    // Data model: These strings will be the data for the table view cells
    //let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    var arrayMenuOptions = [Dictionary<String,String>]()
   
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        arrayMenuOptions.append(["title":"The Weeknd | CS 7:00pm", "icon":"weeknd.jpg","numFriends":"3"])
        arrayMenuOptions.append(["title":"Kygo | OT 7:30pm", "icon":"kygo.jpg","numFriends":"1"])
        arrayMenuOptions.append(["title":"St. Vincent | CS 7:45pm", "icon":"vincent.jpg","numFriends":""])
        arrayMenuOptions.append(["title":"The War On Drugs | OT 8:15pm", "icon":"twod.jpg","numFriends":""])
        arrayMenuOptions.append(["title":"Vince Staples | CS 9:00pm", "icon":"vincestaples.jpg","numFriends":""])
        arrayMenuOptions.append(["title":"Alan Walker | OT 9:00pm", "icon":"walker.jpg","numFriends":""])
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMenuOptions.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        // set the text from the data model
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        let numFriends : UILabel = cell.contentView.viewWithTag(102) as! UILabel
        imgIcon.layer.cornerRadius = 20.5
        imgIcon.layer.masksToBounds = true
        imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        numFriends.text = arrayMenuOptions[indexPath.row]["numFriends"]!
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
