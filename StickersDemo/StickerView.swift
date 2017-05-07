//
//  StickerView.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

class StickerView: UIView, Sticker {
    
    internal var image: UIImage
    
    weak var parent: StickerCell?
    
    // Won't be used, only created for testing purposes 
    required init (image: UIImage, x: CGFloat, y: CGFloat) {
        let h = StickerConstants.StickerHeight
        self.image = image.resizeImage(newHeight: h)
        
        let f = CGRect.init(x: x, y: y, width: image.size.width, height: h) // Frame
        
        super.init(frame: f)
        setup()
    }
    
    // Called when initialized from a StickerCell
    required init (parent: StickerSource) {
        
        // Must get absolute coordinates of parent since it is embedded inside a ContainerView
        let coords = parent.convert(parent.bounds.origin, to: UIScreen.main.focusedView)
        
        // Draw rect with the same properties as parent
        let f = CGRect.init(x: coords.x, y: coords.y, width: parent.frame.width, height: parent.frame.height)
        
        self.image = parent.image
        
        super.init(frame: f)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let imageView: UIImageView = UIImageView(image: self.image)
        self.insertSubview(imageView, at: 0)

        setupRecognizers()
    }
    
}

// MARK: Gestures

extension StickerView: Draggable, UIGestureRecognizerDelegate {
    
    // Add gesture recognizers to StickerView
    func setupRecognizers () {
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(scale(_ :)))
        pinch.delegate = self
        self.addGestureRecognizer(pinch)
        
        let move = UIPanGestureRecognizer(target: self, action: #selector(move(_ :)))
        move.delegate = self
        self.addGestureRecognizer(move)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotate(_ :)))
        rotate.delegate = self
        self.addGestureRecognizer(rotate)
    }
    
    func scale(_ gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .changed:
            
            self.transform = self.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1
        default:
            break
        }
    }
    
    func rotate(_ gesture: UIRotationGestureRecognizer) {
        switch gesture.state {
        case .changed:
            
            gesture.view?.transform = (gesture.view?.transform)!.rotated(by: gesture.rotation);
            gesture.rotation = 0
        default:
            break
        }
    }
    
    func move(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            
            let translation = gesture.translation(in: self.superview)
            if let view = gesture.view {
                view.center = CGPoint(x:self.center.x + translation.x,
                                      y:self.center.y + translation.y)
            }
            gesture.setTranslation(CGPoint.zero, in: self)
        default:
            break
        }
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // Called when StickerView is placed back in StickersDock
    func returnToParent() {
        // Animate returning to parent then delete
        
        
    }
}





