//
//  MapViewController.swift
//  toDoList
//
//  Created by Student on 5/3/17.
//  Copyright © 2017 SHP. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
    
    //MapKit
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User's Location
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 8.0, *) {
            locationManager.requestAlwaysAuthorization()
        } else {
            
            //FallBack on earlier verisons
            
        }
        locationManager.startUpdatingLocation()
        
        //add gesture reconginzer 
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.mapLongPress(_:))) // colon needs to pass through
        
        //add gesture recongization
        map.addGestureRecognizer(longPress)
    }
    
    func mapLongPress(_ recognizer: UIGestureRecognizer) {
        print(" A long press has been detected")
        
        let touchedAt = recognizer.location(in: self.map)
        // adds location to the view it was presed
        
        let touchedAtCoordinate: CLLocationCoordinate2D = map.convert(touchedAt, toCoordinateFrom: self.map) // gerts the coordinates
        
        let newPin = MKPointAnnotation()
        newPin.coordinate = touchedAtCoordinate
        map.addAnnotation(newPin)
    }
   
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
       
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
       
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01 , longitudeDelta: 0.01))
        //set region pn the map 
        
        self.map.setRegion(region, animated: true)
        
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

}
    


