//
//  Location.swift
//  justShare
//
//  Created by Nio Nguyen on 4/22/15.
//  nio.huynguyen@gmail.com
//  Copyright (c) 2015 Nio Nguyen. All rights reserved.
//

import CoreLocation
import MapKit

class PlaceAnnotation : NSObject, MKAnnotation {
    var place:Place!
    init(_place: Place) {
        self.place = _place
    }
    
    @objc var coordinate: CLLocationCoordinate2D {
        return self.place!.location!.coordinate
    }
    
    var title: String! {
        return self.place!.placeName
    }
    
}