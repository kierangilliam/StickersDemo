//
//  StickerCell.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

class StickerCell: UICollectionViewCell, Sticker {
    
    internal var image: UIImage
    
    required init (image: UIImage, x: CGFloat, y: CGFloat) {
        let w = image.size.width * StickerConstants.ScaleWidthFactor   // Width
        let h = image.size.height * StickerConstants.ScaleHeightFactor // Height
        let f = CGRect.init(x: x, y: y, width: w, height: h)           // Frame
        
        self.image = image.resizeImage(newWidth: w)
        
        super.init(frame: f)
        setup()
    }
    
    func setup() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
