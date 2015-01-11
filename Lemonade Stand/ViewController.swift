//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Keenan Jaenicke on 1/11/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //labels
    @IBOutlet weak var budgetAvailableLabel: UILabel!
    @IBOutlet weak var lemonsAvailableLabel: UILabel!
    @IBOutlet weak var iceCubesAvailableLabel: UILabel!
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    
    //constants
    let budgetFormat = "%.2f"
    
    //initial values
    var budgetAvailable: Double = 10.00
    var lemonsAvailable = 1
    var iceCubesAvailable = 1
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateAvailabilityLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAvailabilityLabels() {
        self.budgetAvailableLabel.text = "$\( NSString(format: self.budgetFormat, self.budgetAvailable))"
        self.lemonsAvailableLabel.text = "\(self.lemonsAvailable + self.lemonsToPurchase) Lemons"
        self.iceCubesAvailableLabel.text = "\(self.iceCubesAvailable + self.iceCubesToPurchase) Ice Cubes"
        self.lemonsToPurchaseLabel.text = "\(self.lemonsToPurchase)"
        self.iceCubesToPurchaseLabel.text = "\(self.iceCubesToPurchase)"
    }
    
    @IBAction func addLemonToPurchaseButtonPressed(sender: AnyObject) {
        if self.budgetAvailable >= 2 {
            self.budgetAvailable -= 2.00
            self.lemonsToPurchase++
            self.updateAvailabilityLabels()
        }
        else {
            println("You're outta money foo!")
        }
    }
    
    @IBAction func subtractLemonToPurchaseButtonPressed(sender: AnyObject) {
        if self.lemonsToPurchase > 0 {
            self.lemonsToPurchase--
            self.budgetAvailable += 2.00
            self.updateAvailabilityLabels()
        }
        else {
            println("No lemons to return, dude")
        }
    }
    
    @IBAction func addIceCubeToPurchaseButtonPressed(sender: AnyObject) {
        if self.budgetAvailable >= 1 {
            self.budgetAvailable -= 1.00
            self.iceCubesToPurchase++
            self.updateAvailabilityLabels()
        }
        else {
            println("You're outta money")
        }
    }
    
    @IBAction func subtractIceCubeToPurchaseButtonPressed(sender: AnyObject) {
        if self.iceCubesToPurchase > 0 {
            self.iceCubesToPurchase--
            self.budgetAvailable += 1.00
            self.updateAvailabilityLabels()
        }
        else {
            println("No ice cubes to sell back")
        }
    }
    
    @IBAction func addLemonForMixtureButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func subtractLemonForMixtureButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func addIceCubeForMixtureButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func subtractIceCubeForMixtureButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
    }
    
}

