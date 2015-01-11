//
//  LemonadeStand.swift
//  Lemonade Stand
//
//  Created by Keenan Jaenicke on 1/11/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import Foundation

class LemonadeStand {
    
    class func computeDailyRevenue(numberOfLemons: Int, numberOfIceCubes: Int, customers : [Customer]) -> Double {
        var revenue = 0.00
        var lemonadeRatio = LemonadeStand.computeLemonadeRatio(numberOfLemons, numberOfIceCubes: numberOfIceCubes)
        
        for customer in customers {
            var satisfiedCustomer = LemonadeStand.wasCustomerSatisfied(customer, lemonadeRatio: lemonadeRatio)
            
            if satisfiedCustomer {
                revenue += 1.00
                println("Paid!  Customer Preference: \(customer.tastePreference)")
            }
            else {
                println("No Match, No Revenue!  Customer Preference: \(customer.tastePreference)")
            }
        }
        
        return revenue
    }
    
    class func computeLemonadeRatio(numberOfLemons: Int, numberOfIceCubes: Int) -> Double {
        if numberOfIceCubes > 0 {
            return Double(numberOfLemons / numberOfIceCubes)
        }
        else {
            return 0.00
        }
    }
    
    class func wasCustomerSatisfied(customer: Customer, lemonadeRatio: Double) -> Bool {
        if customer.tastePreference < 0.4 && lemonadeRatio > 1 {
            return true
        }
        else if customer.tastePreference > 0.4 && customer.tastePreference < 0.6 && lemonadeRatio == 1{
            return true
        }
        else if customer.tastePreference > 0.6 && lemonadeRatio < 1 {
            return true
        }
        
        return false
    }
}