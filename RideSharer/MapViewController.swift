//
//  MapViewController.swift
//  RideSharer
//
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // alert
            userLocationDeniedAlert()
        }
    }
    
    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
          case .authorizedWhenInUse:
            locationManager.requestLocation()
            mapView.showsUserLocation = true
           case .denied:
              userLocationDeniedAlert() // Show alert telling users how to turn on permissions
              break
          case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
          case .restricted: // Show an alert letting them know what’s up
           break
          case .authorizedAlways:
           break
          @unknown default:
              break
          }
    }
    
    func userLocationDeniedAlert() {
        // create the alert
        let alert = UIAlertController(title: "Location Denied", message: "You have not provided this app permission to view your location. Please turn on location for this app", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        present(alert, animated: true, completion: nil)

    }
    
}
