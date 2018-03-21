//
//  DirectionViewController.swift
//  Rally
//
//  Created by Adam Benwood on 2018-03-08.
//  Copyright © 2018 Adam Benwood. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var selected: UILabel!
    // Data model: These strings will be the data for the table view cells
    //let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        arrayMenuOptions.append(["title":"RallyPoint", "icon":"rallypoint.png","distance":"10M"])
        arrayMenuOptions.append(["title":"Jen", "icon":"circle-purple.png","distance":"20M"])
        arrayMenuOptions.append(["title":"Rob", "icon":"circle-green.png","distance":"22M"])
        arrayMenuOptions.append(["title":"Brandon", "icon":"circle-red.png","distance":"30M"])
        arrayMenuOptions.append(["title":"Coachella Stage", "icon":"stage.png","distance":"30M"])
        arrayMenuOptions.append(["title":"Outdoor Theatre", "icon":"stage.png","distance":"60M"])
        arrayMenuOptions.append(["title":"Victoria", "icon":"circle-blue.png","distance":"65M"])
        
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
        //cell.selectionStyle = UITableViewCellSelectionStyle.init(rawValue: 5)!
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        let distance: UILabel = cell.contentView.viewWithTag(102) as! UILabel
        //imgIcon.layer.cornerRadius = 20.5
        //imgIcon.layer.masksToBounds = true
        imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        distance.text = arrayMenuOptions[indexPath.row]["distance"]!
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        switch(indexPath.row){
        case 0:
            selected.text = "RallyPoint Selected"

            
            break
        case 1:
            selected.text = " Jen Selected"
            
            
            break
        case 2:
            selected.text = " Rob Selected"
         
            
            break
        case 3:
            selected.text = " Brandon Selected"
        
            
            break
        case 4:
            selected.text = " Coachella Stage Selected"
            
            
            break
        case 5:
            selected.text = " Outdoor Theatre Selected"
            
            
            break
        case 6:
            selected.text = " Victoria Selected"
            
            
            break
        default:
            selected.text = " Null Selected"
        }
    }

}
