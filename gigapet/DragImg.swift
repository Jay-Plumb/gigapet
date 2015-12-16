//
//  DragImg.swift
//  gigapet
//
//  Created by Jason Plumb on 11/12/2015.
//  Copyright © 2015 JasonPlumb. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView? // Yes its a UIImage but we picked a base class so we can drag over other object types in the future e.g. buttons
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center // Get image views center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview) // Position of finger touched
            self.center = CGPointMake(position.x, position.y) // Where ever your finger is, lets move the object there
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // check if we have dropped on the target
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview)
            // Check if position is inside object(target)
            if CGRectContainsPoint(target.frame, position) {
                // Create a service
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        self.center = originalPosition
    }
}
