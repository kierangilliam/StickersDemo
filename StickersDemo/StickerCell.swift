//
//  StickerCell.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit


// I would do this if I implemented a UICollectionView (Probably smarter)

class StickerCell: UICollectionViewCell, Sticker {
    
    internal var image: UIImage
    
    required init (image: UIImage, x: CGFloat, y: CGFloat) {
        let h = StickerConstants.StickerHeight
        self.image = image.resizeImage(newHeight: h)
        
        let f = CGRect.init(x: x, y: y, width: image.size.width, height: h) // Frame
        
        super.init(frame: f)
        setup()
    }
    
    func setup() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
