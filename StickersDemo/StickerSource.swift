//
//  StickerSource.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

class StickerSource: UIView, Sticker {
    
    internal var image: UIImage
    
    // Reference to child we are creating and moving (Refer to gestures)
    var currentChild: StickerView?
    
    required init (image: UIImage, x: CGFloat, y: CGFloat) {
        let h = StickerConstants.StickerHeight
        self.image = image.resizeImage(newHeight: h)
        
        let f = CGRect.init(x: x, y: y, width: self.image.size.width, height: h) // Frame
        
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

class ImmediatePanGesture: UIPanGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if (self.state == UIGestureRecognizerState.began) {
            return
        }
        super.touchesBegan(touches, with: event)
        self.state = UIGestureRecognizerState.began;
    }
}

// MARK: Gestures

extension StickerSource: UIGestureRecognizerDelegate {
    
    
    // Add gesture recognizers to StickerView
    func setupRecognizers () {
        self.isUserInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(createSticker(_ :)))
        pan.delegate = self
        self.addGestureRecognizer(pan)
    }
    
    
    // When user starts to move a sticker from container, create a stickerView and add to parent view
    func createSticker(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Pan began")
            currentChild = StickerView(parent: self)
            self.superview?.superview?.addSubview(currentChild!)
            
            
        case .changed:
            print("Pan changing")
            // Move child to current pan coords
            currentChild?.moveByParent(gesture.translation(in: self.superview?.superview))
            gesture.setTranslation(CGPoint.zero, in: self.superview?.superview)
            
        case .ended:
            // Remove reference of child we were moving
            currentChild = nil
            
        default:
            break
        }
    }
}
