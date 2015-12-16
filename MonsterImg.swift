//
//  MonsterImg.swift
//  gigapet
//
//  Created by Jason Plumb on 14/12/2015.
//  Copyright © 2015 JasonPlumb. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    // Override and call super inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation() {
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
            imgArray.append(img!)
        }
        // Previously had monsterImg. but now we are the monster so use self.
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        // Default image
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil // Empty old images as a precaution
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 5; x++ {
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        // Previously had monsterImg. but now we are the monster so use self.
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    // Revive character
    func restartAnimation() {
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil // Empty old images as a precaution
        
        var imgArray = [UIImage]()
        for var x = 5; x >= 1; x-- {
            let img = UIImage(named: "dead\(x).png")
            imgArray.append(img!)
        }
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
}
