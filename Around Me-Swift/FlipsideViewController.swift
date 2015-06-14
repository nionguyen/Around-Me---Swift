//
//  FlipsideViewController.swift
//  Around Me-Swift
//
//  Created by Nio Nguyen on 6/5/15.
//  nio.huynguyen@gmail.com
//  Copyright (c) 2015 Nio Nguyen. All rights reserved.
//

import UIKit
import MapKit
class FlipsideViewController: UIViewController, ARLocationDelegate, ARDelegate, ARMarkerDelegate, MarkerViewDelegate {
    
    var userLocation:MKUserLocation?
    var locations = [Place]()
    var geoLocationsArray = [ARGeoCoordinate]()
    var _arController:AugmentedRealityController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (_arController == nil) {
            _arController = AugmentedRealityController(view: self.view, parentViewController: self, withDelgate: self)
            
            _arController!.minimumScaleFactor = 0.5
            _arController!.scaleViewsBasedOnDistance = true
            _arController!.rotateViewsBasedOnPerspective = true
            _arController!.debugMode = false
        }
        geoLocations()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateGeoLocations() {        
        for place in locations {
            var coordinate:ARGeoCoordinate = ARGeoCoordinate(location: place.location, locationTitle: place.placeName)
            coordinate.calibrateUsingOrigin(userLocation?.location)
            
            var markerView:MarkerView = MarkerView(_coordinate: coordinate, _delegate: self)
            coordinate.displayView = markerView
            
            _arController?.addCoordinate(coordinate)
            geoLocationsArray.append(coordinate)
        }
        
    }
    
    func locationClicked(coordinate:ARGeoCoordinate) {
    
    }
    
    func geoLocations() -> NSMutableArray{
        
        if(geoLocationsArray.count == 0) {
            generateGeoLocations()
        }
        return NSMutableArray(array: geoLocationsArray) ;

    }
    
    func locationClicked() {
    }
    
    func didUpdateHeading(newHeading:CLHeading){
        
    }
    func didUpdateLocation(newLocation:CLLocation){
        
    }
    func didUpdateOrientation(orientation:UIDeviceOrientation) {
        
    }
    
    func didTapMarker(coordinate:ARGeoCoordinate) {
        
    }
    
    func didTouchMarkerView(markerView:MarkerView) {
        
    }
    
    @IBAction func doneAction() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
