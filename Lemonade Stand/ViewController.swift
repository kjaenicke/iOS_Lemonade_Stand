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
    @IBOutlet weak var lemonsToUseLabel: UILabel!
    @IBOutlet weak var iceCubesToUseLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    //constants
    let budgetFormat = "%.2f"
    let availableWeatherStatuses: [String] = ["Cold", "Mild", "Warm"]

    //initial values
    var budgetAvailable: Double = 10.00
    var lemonsAvailable = 1
    var iceCubesAvailable = 1
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToUse = 0
    var iceCubesToUse = 0
    var currentWeatherStatus: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setTodaysWeatherStatus()
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
        self.lemonsToUseLabel.text = "\(self.lemonsToUse)"
        self.iceCubesToUseLabel.text = "\(self.iceCubesToUse)"
    }
    
    func setTodaysWeatherStatus(){
        currentWeatherStatus = availableWeatherStatuses[Int(arc4random_uniform(UInt32(2)))]
        weatherImageView.image = UIImage(named: currentWeatherStatus)
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
        if (lemonsAvailable + lemonsToPurchase) > lemonsToUse {
            lemonsToUse++
            updateAvailabilityLabels()
        }
    }
    
    @IBAction func subtractLemonForMixtureButtonPressed(sender: AnyObject) {
        if lemonsToUse > 0 {
            lemonsToUse--
            updateAvailabilityLabels()
        }
    }
    
    @IBAction func addIceCubeForMixtureButtonPressed(sender: AnyObject) {
        if (iceCubesAvailable + iceCubesToPurchase) > iceCubesToUse {
            iceCubesToUse++
            updateAvailabilityLabels()
        }
    }
    
    @IBAction func subtractIceCubeForMixtureButtonPressed(sender: AnyObject) {
        if iceCubesToUse > 0 {
            iceCubesToUse--
            updateAvailabilityLabels()
        }
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        var customers: [Customer] = []
        var weatherMultiplier: Int
        
        switch currentWeatherStatus{
            case "Cold":
            weatherMultiplier = -3
            
            case "Mild":
            weatherMultiplier = 0
            
            case "Warm":
            weatherMultiplier = 3
            
            default:
            weatherMultiplier = 0
        }
        
        let numberOfCustomers = Int(arc4random_uniform(UInt32(10))) + weatherMultiplier
        
        if numberOfCustomers > 0 {
            for var i = 1; i < numberOfCustomers; i++ {
                var customer = Customer()
                customers.append(customer)
            }
        }
        
        var revenue = LemonadeStand.computeDailyRevenue(lemonsToUse, numberOfIceCubes: iceCubesToUse, customers: customers)
        
        budgetAvailable += Double(revenue)
        lemonsAvailable = (lemonsAvailable + lemonsToPurchase) - lemonsToUse
        iceCubesAvailable = (iceCubesAvailable + iceCubesToPurchase) - iceCubesToUse
        
        //reset our initial values
        lemonsToPurchase = 0
        iceCubesToPurchase = 0
        lemonsToUse = 0
        iceCubesToUse = 0
        
        setTodaysWeatherStatus()
        updateAvailabilityLabels()
    }
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        budgetAvailable = 10.00
        lemonsAvailable = 1
        iceCubesAvailable = 1
        lemonsToPurchase = 0
        iceCubesToPurchase = 0
        lemonsToUse = 0
        iceCubesToUse = 0
        
        setTodaysWeatherStatus()
        updateAvailabilityLabels()
    }
}

