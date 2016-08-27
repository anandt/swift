//
//  ViewController.swift
//  PraviteTaxi
//
//  Created by Anand tellabati on 26/08/16.
//  Copyright © 2016 Anand tellabati. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController ,CLLocationManagerDelegate ,MKMapViewDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate {

    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var searchBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var targetLocation: UIButton!
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!

    var geoCoder : CLGeocoder!
    var locationManager : CLLocationManager!
    var previousAddress : String!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
        geoCoder = CLGeocoder()
        self.mapView.delegate = self;

        title="Location"
 
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 102/255.0, green:105/255.0, blue: 114/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let mapDragRecognizer = UIPanGestureRecognizer(target: self, action: "didDragMap:")
        mapDragRecognizer.delegate = self
        self.mapView.addGestureRecognizer(mapDragRecognizer)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func didDragMap(gestureRecognizer: UIGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizerState.Began) {
            print("Map drag began")
            targetLocation.hidden = true
            addressView.hidden = true
            self.navigationController?.navigationBarHidden = true
            
        }
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Ended) {
            print("Map drag ended")
            targetLocation.hidden = false
            addressView.hidden = false
            self.navigationController?.navigationBarHidden = false
        }
    }
    




    func geoCode(location : CLLocation!) {
        
        /* Only one reverse geocoding can be in progress at a time hence we need to cancel existing
        one if we are getting location updates */
        
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (data, error) -> Void in
            guard let placeMarks = data as [CLPlacemark]! else {
                return
            }
            let loc: CLPlacemark = placeMarks[0]
            let addressDict : [NSString:NSObject] = loc.addressDictionary as! [NSString: NSObject]
            let addrList = addressDict["FormattedAddressLines"] as! [String]
            let address = addrList.joinWithSeparator(",")
            print(address)
            self.addressTextView.text = address
            self.previousAddress = address
        })
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.first!
        self.mapView.centerCoordinate = location.coordinate
        let reg = MKCoordinateRegionMakeWithDistance(location.coordinate, 150, 150)
        self.mapView.setRegion(reg, animated: true)
        geoCode(location)
    }
    
    


    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error: " + error.localizedDescription)
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        geoCode(location)
    }
    
    
    @IBAction func searchAction(sender: AnyObject) {
//        let searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
//        searchBar.showsCancelButton =  true
//        searchBar.placeholder = "Your Location"
//        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }


}

