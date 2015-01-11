//
//  Customer.swift
//  Lemonade Stand
//
//  Created by Keenan Jaenicke on 1/11/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import Foundation
import UIKit

struct Customer{
    let tastePreference: CGFloat
    
    init() {
        self.tastePreference = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
}