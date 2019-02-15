//
//  ExerciseCoach.swift
//  TheArithmeticAPP
//
//  Created by Suresh on 2/14/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
struct ExerciseCoach{
    
    static func energyConsumed(during: String, weight: Double, time: Int) -> Double
    {
        let sports : [String : Double] = ["Bicycling" :8.0, "Jumping Rope": 12.3, "Running - slow": 9.8, "Running - fast": 23.0, "Tennis": 8.0, "Swimming": 5.8 ]
        let getMet = sports[during]!
        let calEnergy = getMet * 3.5 * weight/2.2/200 * Double(time)
        return calEnergy
    }
    
    static func timeToLose1Pound(during: String, weight: Double) -> Double
    {
        let sports : [String : Double] = ["Bicycling" :8.0, "Jumping Rope": 12.3, "Running - slow": 9.8, "Running - fast": 23.0, "Tennis": 8.0, "Swimming": 5.8 ]
        let getMet = sports[during]
        let time = 3500 / (getMet! * 3.5 * weight/2.2/200)
        return time
        
        
    }
}
