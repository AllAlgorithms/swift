//
//  locationUtilities.swift
//  
//
//  Created by Pedro Contine on 19/10/19.
//


import UIKit
import MapKit
import CoreLocation

func convertCoordinateDegreesToMeters(degrees: Double) -> Double {
    return degrees * 111139
}

func calcDistanceBetweenCoordinatesDegrees(degreeA: Double, degreeB: Double) -> Double{
    var distance: Double = 0.0
    
    if degreeA < 0 && degreeB < 0 || degreeA > 0 && degreeB > 0 {
        if degreeA > degreeB {
            distance = degreeA - degreeB
        }
        else{
            distance = degreeB - degreeA
        }
    }
    else if degreeA > 0 && degreeB < 0 || degreeA < 0 && degreeB > 0{
        distance = degreeA + degreeB
    }
    
    return distance
}

func isLocationInRange(location: CLLocationCoordinate2D, center: CLLocationCoordinate2D, rangeInMeters: Double) -> Bool {
    var isInRange: Bool = false
    
    let distLatitude = calcDistanceBetweenCoordinatesDegrees(degreeA: center.latitude, degreeB: location.latitude)
    let distLongitude = calcDistanceBetweenCoordinatesDegrees(degreeA: center.longitude, degreeB: location.longitude)
    
    let metersLatitude = convertCoordinateDegreesToMeters(degrees: distLatitude)
    let metersLongitude = convertCoordinateDegreesToMeters(degrees: distLongitude)
    
    //pythagorean theorem
    let range = sqrt(pow(metersLatitude, 2) + pow(metersLongitude, 2))
    
    if range <= rangeInMeters && metersLongitude <= rangeInMeters {
        isInRange = true
    }
    
    return isInRange
}

//Example

let rangeInMeters: Double = 1000.0
let center = CLLocationCoordinate2D(latitude: -22.8184, longitude: -47.0647)
let location = CLLocationCoordinate2D(latitude: -22.8170, longitude: -47.0600)

let isInRange = isLocationInRange(location: location, center: center, rangeInMeters: rangeInMeters)
print(isInRange)

