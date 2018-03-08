//
//  ViewController.swift
//  Rally
//
//  Created by Adam Benwood on 2018-01-26.
//  Copyright © 2018 Adam Benwood. All rights reserved.
//
import UIKit
import GoogleMaps
//import SlideMenuControllerSwift

class MainViewController: BaseViewController {
    
 
    @IBOutlet var mapView: GMSMapView!
    override func loadView() {
       /* UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })*/
        
        self.addSlideMenuButton()
        //NAVIGATION BAR
        //Following code sets the navigation bar transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        navigationItem.title = "--M FROM RALLY POINT"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font: UIFont(name: "HavelockTitling-Regular", size: 15)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //END NB
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 49.2366,
                                              longitude: -122.9781,
                                              zoom: 17)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.settings.myLocationButton = true
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        view = mapView
        
        let person1 = GMSMarker()
        person1.position = CLLocationCoordinate2D(latitude: 49.2366, longitude: -122.9782)
        person1.title = "Jen"
        person1.snippet = "10M"
        let image = UIImage(named: "placeholder.png")
        person1.icon = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        person1.map = mapView
        
        let person2 = GMSMarker()
        person2.position = CLLocationCoordinate2D(latitude: 49.2369, longitude: -122.9787)
        person2.title = "Rob"
        person2.snippet = "10M"
        let image2 = UIImage(named: "placeholder.png")
        person2.icon = image2?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        person2.map = mapView
        
        let rallypoint = GMSMarker()
        rallypoint.position = CLLocationCoordinate2D(latitude: 49.2360, longitude: -122.9775)
        rallypoint.title = "RallyPoint"
        rallypoint.snippet = "Meet In 10 Mins"
        let image3 = UIImage(named: "rallypoint.png")
        rallypoint.icon = image3?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        rallypoint.map = mapView
        
    }

    
}
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
