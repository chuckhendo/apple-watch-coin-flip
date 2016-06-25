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
    @IBOutlet var coin: WKInterfaceImage!
    
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
    
    func animateCoin(result:UInt32) {
        let iterations = Int(2)
        let duration = Double(0.5)
        let totalFrames = 8
        let timePerFrame = duration / Double(totalFrames)

        coin.startAnimatingWithImagesInRange(NSRange(location: 1, length: totalFrames), duration: duration, repeatCount: iterations)
        delay((Double(iterations) * duration) - timePerFrame) {
            if(result == 1) {
                self.coin.startAnimatingWithImagesInRange(NSRange(location: 1, length: 4), duration: timePerFrame * 4, repeatCount: 1)
            }
        }
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
        self.coin.stopAnimating()
        self.coin.setImageNamed("coin")
        let randomNum = arc4random_uniform(2)
        animateCoin(randomNum)
    }

}
