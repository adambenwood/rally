//
//  DirectionViewController.swift
//  Rally
//
//  Created by Adam Benwood on 2018-03-08.
//  Copyright © 2018 Adam Benwood. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController {
    

    var distanceMessage = "10M FROM RALLY POINT"
    var pickerData = ["RallyPoint","Jen","Rob"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet var selectLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
