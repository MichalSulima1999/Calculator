//
//  Calculate.swift
//  Calculator
//
//  Created by Michael on 10/10/2023.
//

import Foundation

struct Calculations {
    static func add(_ a: Int?, _ b: Int?) -> Int? {
        if (a == nil || b == nil) {
            return nil
        }
        return a! + b!
    }
    
    static func subtract(_ a: Int?, _ b: Int?) -> Int? {
        if (a == nil || b == nil) {
            return nil
        }
        return a! - b!
    }
    
    static func multiply(_ a: Int?, _ b: Int?) -> Int? {
        if (a == nil || b == nil) {
            return nil
        }
        return a! * b!
    }
    
    static func divide(_ a: Int, _ b: Int) -> Double? {
        if b == 0 {
            return Double.nan
        } else {
            return Double(a) / Double(b)
        }
    }
    
    static func calculateSin(_ a: Int) -> Double? {
        return sin(Double(a))
    }
}
