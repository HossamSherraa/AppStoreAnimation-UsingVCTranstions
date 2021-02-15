//
//  DetailsViewController.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

////***
//topTitle.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 30) ,
//topTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 20),
//mainTitle.leadingAnchor.constraint(equalTo: topTitle.leadingAnchor),
//mainTitle.topAnchor.constraint(equalTo: topTitle.bottomAnchor , constant: 3),
//contentView.trailingAnchor.constraint(equalTo: mainTitle.trailingAnchor , constant: 30)****//

import UIKit
class DetailsViewController : UIViewController , UIViewControllerTransitioningDelegate {
    var coverMultiplier : CGFloat = 1
    var textMultiplier : CGFloat =  0
    let blureView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    let coverImage : UIImageView = UIImageView()
    let textView  = UILabel()
    let topTitle  = UILabel()
    let mainTitle = UILabel()
    let closeButton = UIButton()
    var selectedCell : AppStoreCell!
    
    var contentConstrains = [NSLayoutConstraint]()
    var viewConstrains  = [NSLayoutConstraint]()
    var toBeActivated = [NSLayoutConstraint]()
    init(coverImage : UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.textView.text = "The methods of this protocol handle size-related transitions that are related to changes in the current trait environment or view controller hierarchy. When the parent view controller changes, or when trait changes occur that affect the size of a view controller, UIKit calls these methods to give the affected objects a chance to respond appropriately All UIViewController and UIPresentationController objects provide default implementations for the methods of this protocol. When creating your own custom view controller or presentation controller, you can override the default implementations to make adjustments to your content. For example, you might use these methods to adjust the size or position of any child view controllers.When overriding the methods of this protocol, call super to let UIKit perform any default behaviors. View controllers and presentation controllers perform their own adjustments when these methods are called. Calling super ensures that UIKit is able to continue adjusting other parts of your user interface"
        
        self.coverImage.image = coverImage
        self.view.addSubview(self.coverImage)
        self.view.addSubview(textView)
        self.coverImage.contentMode  = .scaleAspectFill
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
        self.coverImage.addSubview(topTitle)
        self.coverImage.addSubview(mainTitle)
        topTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        self.coverImage.translatesAutoresizingMaskIntoConstraints = false
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.coverImage.clipsToBounds = true 
        topTitle.text = "APPLE ARCADE"
        topTitle.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        mainTitle.numberOfLines = 0
        mainTitle.text = "Ride like a pro in saynara wild hearts"
        mainTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        closeButton.setImage(UIImage(named: "closeIcon"), for: .normal)
        closeButton.addTarget(self, action: #selector(self.handelCloseButton), for: .touchUpInside)
        
        self.view.clipsToBounds = true
        self.view.layer.cornerRadius = 18
        //0 7
        
        self.view.addSubview(closeButton)
        
        self.contentConstrains = [
            self.coverImage.heightAnchor.constraint(equalToConstant: 300 ),
            self.coverImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor) ,
            self.coverImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor) ,
            self.coverImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            
            
            self.textView.topAnchor.constraint(equalTo: self.coverImage.bottomAnchor),
            self.textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor  ),
            
            
            
            topTitle.topAnchor.constraint(equalTo: self.coverImage.topAnchor , constant: 30) ,
            topTitle.leadingAnchor.constraint(equalTo: self.coverImage.leadingAnchor , constant: 20),
            mainTitle.leadingAnchor.constraint(equalTo: topTitle.leadingAnchor),
            mainTitle.topAnchor.constraint(equalTo: topTitle.bottomAnchor , constant: 3),
            
            
            mainTitle.widthAnchor.constraint(equalToConstant: 250),
            
            
            
            closeButton.topAnchor.constraint(equalTo: self.coverImage.topAnchor , constant:  -130),
            closeButton.trailingAnchor.constraint(equalTo: self.coverImage.trailingAnchor , constant:  -30)
            
            
        ]
        
        
        

        
        self.contentConstrains.forEach{$0.isActive = true }
 
    }
    
  
    
    func setNewContentConstraints (){
        self.contentConstrains[0].isActive = false
        self.contentConstrains[7].isActive = false
        self.toBeActivated.forEach{$0.isActive = true}
    }
    
    @objc func handelCloseButton(){
        self.dismiss(animated: true , completion: nil)
    }
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.textView.numberOfLines = 0
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handelPan(_:)))
        self.view.addGestureRecognizer(panGesture)
    }
    
    var interactiveDismiss : UIPercentDrivenInteractiveTransition?
    @objc func handelPan(_ sender : UIPanGestureRecognizer){
       
        switch sender.state {
        case .began:
            
            interactiveDismiss = InteractiveAnimator()
        dismiss(animated: true , completion: nil)
        case .changed: interactiveDismiss?.update(abs(min(1, sender.translation(in: nil).y / 400)))
        
        case .ended:
            interactiveDismiss?.finish()
        default : break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        TransitionAnimator(cellFrame : self.selectedCell, state: .present)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        TransitionAnimator(cellFrame: self.selectedCell, state: .dismiss)
    }
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactiveDismiss
    }
    
}


extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
