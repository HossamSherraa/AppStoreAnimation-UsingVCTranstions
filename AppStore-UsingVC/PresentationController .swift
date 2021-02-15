//
//  PresentationController .swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class PresentationController : UIPresentationController {
    
    override var shouldRemovePresentersView: Bool {
        return false 
    }
    
    override func presentationTransitionWillBegin() {
        if let  presentedVC = self.presentedViewController as? DetailsViewController {
            self.containerView?.insertSubview(presentedVC.blureView, at: 0)
            presentedVC.blureView.frame = containerView!.frame
            presentedVC.blureView.autoresizingMask = containerView!.autoresizingMask
            presentedVC.blureView.alpha = 0
            presentedVC.transitionCoordinator?.animate(alongsideTransition: { context in
                presentedVC.blureView.alpha = 1
            }, completion: nil)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let  presentedVC = self.presentedViewController as? DetailsViewController {
                   
                  
                   
                   
                   presentedVC.transitionCoordinator?.animate(alongsideTransition: { context in
                       presentedVC.blureView.alpha = 0
                   }, completion: nil)
               }
           
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            if let  presentedVC = self.presentedViewController as? DetailsViewController{
                presentedVC.blureView.removeFromSuperview()
               }
        }
    }
    
}
