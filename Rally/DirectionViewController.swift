//
//  DirectionViewController.swift
//  Rally
//
//  Created by Adam Benwood on 2018-03-08.
//  Copyright © 2018 Adam Benwood. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
        
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "HavelockTitling-Regular", size: 17)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[0]
        pickerLabel?.textColor = UIColor.white
        
        return pickerLabel!
    }

    var distanceMessage = "10M FROM RALLY POINT"
    var pickerData = ["RallyPoint","Jen","Rob"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerview.delegate = self
        self.pickerview.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var pickerview: UIPickerView!
    
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
