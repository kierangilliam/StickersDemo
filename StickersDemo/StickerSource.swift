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

// MARK: Gestures

extension StickerSource: UIGestureRecognizerDelegate {
    
    // Add gesture recognizers to StickerView
    func setupRecognizers () {
        self.isUserInteractionEnabled = true
        
        let tap = UIPanGestureRecognizer(target: self, action: #selector(createSticker(_ :)))
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
    
    // When user starts to move a sticker from container, create a stickerView and add to parent view
    func createSticker(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Pan began")
            let s: StickerView = StickerView(parent: self)
            print(s.bounds.height, s.bounds.width)
            print(StickerConstants.StickerHeight)
            self.superview?.superview?.addSubview(s)
            
            // Attach child to a gesture
            
            
        default:
            break
        }
    }
}
