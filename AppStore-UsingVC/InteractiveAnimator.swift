//
//  InteractiveAnimator.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/28/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class InteractiveAnimator : UIPercentDrivenInteractiveTransition {
    var currentContext : UIViewControllerContextTransitioning?
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        super.startInteractiveTransition(transitionContext)
        self.currentContext = transitionContext
    }
    
    override func cancel() {
        super.cancel()
        currentContext?.completeTransition(false )
    }
    
}
