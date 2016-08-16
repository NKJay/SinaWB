//
//  PopoverAnimation.swift
//  SinaWB
//
//  Created by Geetion on 16/7/28.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

let popoverViewWillPrensent = "popoverViewWillPrensent"
let popoverViewWillDismiss = "popoverViewWillDismiss"

class PopoverAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    private var isPresent = false
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CunstomUIPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        NSNotificationCenter.defaultCenter().postNotificationName(popoverViewWillPrensent, object: self)
        
        isPresent = false
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        NSNotificationCenter.defaultCenter().postNotificationName(popoverViewWillDismiss, object: self)
        
        isPresent = true
        return self
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
        
        if isPresent {
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            fromView!.alpha = 1
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromView!.alpha = 0
            }) { (_) in
                fromView?.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        }else {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            transitionContext.containerView()?.addSubview(toView)
            toView.alpha = 0
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                toView.alpha = 1
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
        

    }
}

