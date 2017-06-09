//
//  MKWalkthrough.swift
//  Pods
//
//  Created by Mina Makary on 6/9/17.
//
//

import UIKit
import CoreGraphics

public class MKWalkthrough: NSObject {
    
    static var overlayView: UIView!
    static var hintLabel: UILabel!
    
    static public func showCircularWalkthrough(onBarButtonItem button: UIBarButtonItem, radius: CGFloat, hint: String) {
        if let view = button.value(forKey: "view") as? UIView {
            showCircularWalkthrough(withCenter: view.center, inView: view.superview!, radius: radius, hint: hint);
        }
    }
    
    static public func showCircularWalkthrough(withCenter center: CGPoint, inView view:UIView, radius: CGFloat, hint: String) {
        
        let screenSize = UIScreen.main.bounds.size
        let currentWindow = UIApplication.shared.keyWindow
        let centerInWindow = currentWindow!.convert(center, from: view)
        let startingPoint = centerInWindow.y - radius
        let endingPoint = centerInWindow.y + radius
        
        initOverlayView()
        
        if screenSize.height - endingPoint > startingPoint {
            initHintLabel(frame: CGRect(x: 16, y: endingPoint + 16, width: screenSize.width - 32, height: screenSize.height - endingPoint - 32), withText: hint, isBellowCircule: true)
        } else {
            initHintLabel(frame: CGRect(x: 16, y: 16, width: screenSize.width - 32, height: startingPoint - 32), withText: hint, isBellowCircule: false)
        }
        
        animateOverlayView(center: centerInWindow, radius: radius)
    }
    
    static private func initOverlayView() {
        let screenSize = UIScreen.main.bounds.size
        overlayView = UIView(frame: CGRect(origin: CGPoint.zero, size: screenSize))
        overlayView.alpha = 0.6
        overlayView.backgroundColor = UIColor.black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MKWalkthrough.handleTap(sender:)))
        overlayView.addGestureRecognizer(tap)
    }
    
    static private func initHintLabel(frame: CGRect, withText hint: String, isBellowCircule: Bool) {
        hintLabel = UILabel(frame: frame)
        hintLabel.numberOfLines = 0
        hintLabel.textColor = UIColor.white
        hintLabel.font = UIFont.systemFont(ofSize: 20)
        hintLabel.text = hint
        
        let size = hintLabel.sizeThatFits(CGSize(width: hintLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        if size.height < hintLabel.frame.height {
            if isBellowCircule {
                hintLabel.frame = CGRect(origin: hintLabel.frame.origin, size: size)
            } else {
                hintLabel.frame = CGRect(origin: CGPoint(x: hintLabel.frame.origin.x, y: hintLabel.frame.origin.y + (hintLabel.frame.height - size.height)), size: size)
            }
        }
        hintLabel.alpha = 0
    }
    
    static private func animateOverlayView(center: CGPoint, radius: CGFloat) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            hintLabel.alpha = 1
        })
        
        let screenSize = UIScreen.main.bounds.size
        let currentWindow = UIApplication.shared.keyWindow
        
        let maskLayer = CAShapeLayer()
        let diagonal = sqrt(pow(screenSize.width, 2) + pow(screenSize.height, 2))
        
        let startingPath = CGMutablePath()
        startingPath.addArc(center: center, radius: diagonal/2, startAngle: 0.0, endAngle: 2 * 3.14, clockwise: false)
        startingPath.addRect(CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        
        let endingPath = CGMutablePath()
        endingPath.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: 2 * 3.14, clockwise: false)
        endingPath.addRect(CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.path = endingPath
        
        let morph = CABasicAnimation(keyPath: "path")
        morph.duration  = 0.5
        morph.fromValue = startingPath
        morph.toValue   = endingPath
        morph.isRemovedOnCompletion = false
        morph.fillMode = kCAFillModeForwards
        maskLayer.add(morph, forKey: "animate circule")
        
        overlayView.layer.mask = maskLayer
        overlayView.clipsToBounds = true
        
        currentWindow?.addSubview(overlayView)
        currentWindow?.addSubview(hintLabel)
        CATransaction.commit()
    }
    
    static func handleTap(sender: UITapGestureRecognizer? = nil) {
        MKWalkthrough.overlayView?.removeFromSuperview()
        MKWalkthrough.hintLabel?.removeFromSuperview()
    }
}
