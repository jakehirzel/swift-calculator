//
//  CustomAnimation.swift
//  Roll
//
//  Created by Jake Hirzel on 11/22/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

extension UIView {
    func blink() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: [.autoreverse, .repeat],
            animations: { [weak self] in self?.alpha = 0.0 },
            completion: { [weak self] _ in self?.alpha = 1.0 })
    }
    
    func fadeIn() {
        UIView.animate(
            withDuration: 0.8,
            delay: 0.0,
            options: UIViewAnimationOptions.curveEaseIn,
            animations: { [weak self] in self?.alpha = 1.0 },
            completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: UIViewAnimationOptions.curveEaseOut,
            animations: { [weak self] in self?.alpha = 0.0 },
            completion: nil)
    }
    
    func pulseOnce(delay: TimeInterval) {
        UIView.animate(
            withDuration: 0.01,
            delay: delay,
            options: [.curveEaseIn, UIViewAnimationOptions.allowUserInteraction],
            animations: { [weak self] in
                self?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            },
            completion: {
                (finished: Bool) -> Void in
                UIView.animate(
                    withDuration: 0.4,
                    delay: 0.1,
                    options: [.curveEaseOut, UIViewAnimationOptions.allowUserInteraction],
                    animations: { [weak self] in
                        self?.transform = CGAffineTransform(scaleX: 1, y: 1)
                    },
                    completion: nil)
        }
        )
    }
    
    func flyUp() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            animations: { [weak self] in
                self?.center.y -= (self?.window?.frame.height)!
            },
            completion: nil
        )
    }
    
    func flyDown() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            usingSpringWithDamping: 0.25,
            initialSpringVelocity: 0.25,
            animations: { [weak self] in
                self?.center.y += (self?.window?.frame.height)!
            },
            completion: nil
        )
    }
    
    func spin(howManyTimes: Int, howLong: TimeInterval) {
        UIView.animateKeyframes(
            withDuration: howLong,
            delay: 0.0,
            options: .calculationModeCubicPaced,
            animations: { [weak self] in
                var quarters = 0
                while quarters <= howManyTimes * 4 {
                    UIView.addKeyframe(
                        withRelativeStartTime: 0.0,
                        relativeDuration: 0.0,
                        animations: { [weak self] in
                            self?.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2) * CGFloat(quarters))
                        }
                    )
                    quarters += 1
                }
            },
            completion: nil
        )
    }
    
    func spinUp() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            animations: { [weak self] in
                self?.center.y -= (self?.window?.frame.height)!
                self?.spin(howManyTimes: 10, howLong: 1.0)
            },
            completion: nil
        )
    }
    
}
