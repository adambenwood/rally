//
//  ViewController.swift
//  Rally
//
//  Created by Adam Benwood on 2018-01-26.
//  Copyright © 2018 Adam Benwood. All rights reserved.
//
import UIKit
import GoogleMaps
import Underdark
//import SlideMenuControllerSwift

class MainViewController: BaseViewController{
    
    var distanceMessage = "10M FROM RALLY POINT"
    
    struct user {
        var name = "default"
        var location = "default"
    }
    
    var friends:[user] = []
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    //var mapView: GMSMapView!
    var zoomLevel: Float = 17.0
    

    @IBOutlet var mapView: GMSMapView!
 
    override func loadView() {
     
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self as? CLLocationManagerDelegate
        
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
        
        navigationItem.title = distanceMessage
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font: UIFont(name: "HavelockTitling-Regular", size: 13)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //END NB
        
        
        
        
        
        
        //load default map position
        let camera = GMSCameraPosition.camera(withLatitude: 33.683300,
                                              longitude: -116.238800,
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
        
        /*for person in friends{
            
        }*/
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // Demo Code
        let person1 = GMSMarker()
        person1.position = CLLocationCoordinate2D(latitude: 33.683943, longitude: -116.239338)
        person1.title = "Jen"
        person1.snippet = "45M"
        var image = UIImage(named: "circle.png")
        image = image?.maskWithColor(color: getRandomColor())
        person1.icon = image?.resizeImage(targetSize: CGSize(width: 10, height: 10))
        person1.map = mapView
        
        let person2 = GMSMarker()
        person2.position = CLLocationCoordinate2D(latitude: 33.683972, longitude: -116.238465)
        person2.title = "Rob"
        person2.snippet = "10M"
        var image2 = UIImage(named: "circle.png")
        image2 = image2?.maskWithColor(color: getRandomColor())
        person2.icon = image2?.resizeImage(targetSize: CGSize(width: 10, height: 10))
        person2.map = mapView
        
        let person3 = GMSMarker()
        person3.position = CLLocationCoordinate2D(latitude: 33.683963, longitude: -116.238809)
        person3.title = "Brandon"
        person3.snippet = "8M"
        var image3 = UIImage(named: "circle.png")
        image3 = image3?.maskWithColor(color: getRandomColor())
        person3.icon = image3?.resizeImage(targetSize: CGSize(width: 10, height: 10))
        person3.map = mapView
        
        let rallypoint = GMSMarker()
        rallypoint.position = CLLocationCoordinate2D(latitude:33.682864, longitude: -116.237731)
        rallypoint.title = "Meetup in 10 Mins"
        rallypoint.snippet = "Requested by Adam"
        let rallyimage = UIImage(named: "rallypoint.png")
        rallypoint.icon = rallyimage?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        rallypoint.map = mapView
        
        // Create MainStage Object
        let mainStage = GMSMutablePath()
        
        mainStage.add(CLLocationCoordinate2D(latitude: 33.684306, longitude: -116.238526))
        mainStage.add(CLLocationCoordinate2D(latitude: 33.684309, longitude: -116.239164))
        mainStage.add(CLLocationCoordinate2D(latitude: 33.684610, longitude: -116.239137))
        mainStage.add(CLLocationCoordinate2D(latitude: 33.684590, longitude: -116.238523))
        
        // Create the polygon, and assign it to the map.
        let polygon = GMSPolygon(path: mainStage)
        polygon.title = "MainStage"
        polygon.fillColor = UIColor.darkGray
        //polygon.strokeColor = .orange
        //polygon.strokeWidth = 2
        polygon.map = mapView
        
        // Create outdoorTheatre Object
        let outdoorTheatre = GMSMutablePath()
        
        outdoorTheatre.add(CLLocationCoordinate2D(latitude: 33.684658, longitude: -116.235183))
        outdoorTheatre.add(CLLocationCoordinate2D(latitude: 33.684434, longitude: -116.234799))
        outdoorTheatre.add(CLLocationCoordinate2D(latitude: 33.684180, longitude: -116.235028))
        outdoorTheatre.add(CLLocationCoordinate2D(latitude: 33.684404, longitude: -116.235430))
        
        // Create the polygon, and assign it to the map.
        let polygon2 = GMSPolygon(path: outdoorTheatre)
        polygon2.title = "Outdoor Theatre"
        polygon2.fillColor = UIColor.darkGray
        //polygon2.strokeColor = .black
        //polygon2.strokeWidth = 2
        polygon2.map = mapView
        
    }
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
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
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
}

extension MainViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
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
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
