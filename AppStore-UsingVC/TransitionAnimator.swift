//
//  TransitionAnimator.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
enum State {
    case present
    case dismiss
}
class TransitionAnimator : NSObject , UIViewControllerAnimatedTransitioning {
    
    let selectedCell : AppStoreCell
    let state : State
    init(cellFrame : AppStoreCell , state : State) {
        self.selectedCell = cellFrame
        self.state = state
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let maxHeight = containerView.frame.height
        let maxWidth = containerView.frame.width
        
        switch self.state {
        case .present:
            let toVC = transitionContext.viewController(forKey: .to)! as! DetailsViewController
            let fromVC = transitionContext.viewController(forKey: .from)! as! ViewController
            let toView = toVC.view!
             let intialFrame = fromVC.view.convert(selectedCell.frame, from: fromVC.collectionView)
            toVC.view.translatesAutoresizingMaskIntoConstraints = false
                containerView.addSubview(toVC.view)
                toVC.contentConstrains[0].constant = intialFrame.height
                toVC.viewConstrains = [
                    toView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: intialFrame.origin.x) ,
                    toView.topAnchor.constraint(equalTo: containerView.topAnchor ,constant: intialFrame.origin.y) ,
                    containerView.trailingAnchor.constraint(equalTo: toView.trailingAnchor , constant: maxWidth - (intialFrame.width + intialFrame.origin.x)),
                    containerView.bottomAnchor.constraint(equalTo: toView.bottomAnchor , constant: maxHeight - (intialFrame.height + intialFrame.origin.y))
                    
                ]
                
                toVC.viewConstrains.forEach{$0.isActive = true}
                containerView.layoutIfNeeded()
               
               
           UIView.animate(withDuration: 0.5, animations: {
                        
                       toVC.viewConstrains.forEach{$0.constant  = 0}
                    toVC.contentConstrains[0].constant = min(containerView.frame.height, containerView.frame.width)
                    toVC.contentConstrains[13].constant = 60

                        
                        containerView.layoutIfNeeded()
                    
                    } , completion: {_ in
                        
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                })
                
                
        case .dismiss:
            let toVC = transitionContext.viewController(forKey: .to)! as! ViewController
            let fromVC = transitionContext.viewController(forKey: .from)! as! DetailsViewController
            let intialFrame = toVC.view.convert(self.selectedCell.frame, from: toVC.collectionView)
            
            
            
            UIView.animate(withDuration: 0.5, animations: {
                fromVC.contentConstrains[13].constant = -70
                fromVC.contentConstrains[0].constant = intialFrame.height
                fromVC.viewConstrains[0].constant = intialFrame.origin.x
                fromVC.viewConstrains[1].constant = intialFrame.origin.y
                fromVC.viewConstrains[2].constant = maxWidth - (intialFrame.width + intialFrame.origin.x)
                fromVC.viewConstrains[3].constant = maxHeight - (intialFrame.height + intialFrame.origin.y)
                containerView.layoutIfNeeded()
                
                

            } , completion:  {
                _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
            
            
           
            }
        }
    
   
    
    
    
}

