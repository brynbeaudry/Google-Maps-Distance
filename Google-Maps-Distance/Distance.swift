//
//  Distance.swift
//  Google-Maps-Distance
//
//  Created by Bryn Beaudry on 2017-10-07.
//  Copyright © 2017 Bryn Beaudry. All rights reserved.
//

import Foundation
import GoogleMaps

func toInt(unsigned: UInt) -> Int {
    
    let signed = (unsigned <= UInt(Int.max)) ?
        Int(unsigned) :
        Int(unsigned - UInt(Int.max) - 1) + Int.min
    
    return signed
}

func calculateDistance(path : GMSMutablePath) -> Double {
    let first : UInt = 0
    let last : UInt = path.count()
    let interval = 1
    
    let sequence = stride(from: first, to: last, by: interval)
    var totalDistance = 0.00
    for element in sequence {
        if(element == last - 1){
            break
        }
        let a = CLLocation(latitude: path.coordinate(at: element).latitude, longitude: path.coordinate(at: element).longitude)
        let b = CLLocation(latitude: path.coordinate(at: element + 1).latitude, longitude: path.coordinate(at: element + 1).longitude)
        totalDistance += Double(a.distance(from: b))
    }
    return totalDistance
}
