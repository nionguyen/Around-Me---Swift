//
//  Created by DaRk-_-D0G on 13/04/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//  Yannickstephan.com
//  redwolfstudio.fr

import Foundation
import CoreGraphics

extension Int {
    /**
    Returns a random integer between 0 and n-1.
    */
    static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    /**
    Create a random num Int
    :param: lower number Int
    :param: upper number Int
    :return: random number Int
    */
    static func random(#min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
}
extension Double {
    /**
    Returns a random floating point number between 0.0 and 1.0, inclusive.
    */
    static func random() -> Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }
    
    /**
    Create a random num Double
    :param: lower number Double
    :param: upper number Double
    :return: random number Double
    */
    static func random(#min: Double, max: Double) -> Double {
        return Double.random() * (max - min) + min
    }
}
extension Float {
    /**
    Returns a random floating point number between 0.0 and 1.0, inclusive.
    */
    static func random() -> Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }
    /**
    Create a random num Float
    :param: lower number Float
    :param: upper number Float
    :return: random number Float
    */
    static func random(#min: Float, max: Float) -> Float {
        return Float.random() * (max - min) + min
    }
}
extension CGFloat {
    /**
    Returns a random floating point number between 0.0 and 1.0, inclusive.
    */
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    /**
    Create a random num CGFloat
    :param: lower number CGFloat
    :param: upper number CGFloat
    :return: random number CGFloat
    */
    static func random(#min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}
