//
//  InterfaceController.swift
//  CoinFlip WatchKit Extension
//
//  Created by Anthony Henderson on 6/23/16.
//  Copyright © 2016 Anthony Henderson. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var button: WKInterfaceButton!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    @IBAction func flipCoin() {
        button.setTitle("Flipping...")
        let randomNum = arc4random_uniform(2)
        let result = randomNum == 1 ? "Heads" : "Tails"
        delay(0.3) {
            self.button.setTitle(result)
        }
    }

}
