//
//  ViewController.swift
//  map
//
//  Created by Nitisha on 2020-02-10.
//  Copyright © 2020 english. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    let regionInMeters : Double = 1000

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    func setUpLocationManager(){
               
               locationManager.delegate = self
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
           }
    
    
    func centerViewUserLocation(){
        
        if let location = locationManager.location?.coordinate{
            
            let region = MKCoordinateRegion.init(center : location, latitudinalMeters: regionInMeters , longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    func checkLocationServices(){
        
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorisation()
            
        }
        else{
            
            
        }
        
       
    }
    func checkLocationAuthorisation(){
        switch CLLocationManager.authorizationStatus(){
       
        case .authorizedWhenInUse:
        
        mapView.showsUserLocation = true
        centerViewUserLocation()
        locationManager.startUpdatingLocation()
        
        case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        case .restricted:
        break
        case .denied:
        break
        case .authorizedAlways:
        break
       
        @unknown default:
            break
        }


  }
}
extension ViewController: CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else{ return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center : center , latitudinalMeters: regionInMeters , longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       checkLocationAuthorisation()
    }
   
}

