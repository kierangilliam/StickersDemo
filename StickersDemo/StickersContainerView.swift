//
//  StickersContainerView.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

class StickersContainerView: UIView {
    
    var stickerNames: [String]!

    init (stickerNames: [String]) {
        print("StickersContainerViewLoaded")
        let b = UIScreen.main.bounds // Bounds
        let f = CGRect.init(x: 0, y: b.height - StickerConstants.ContainerHeight, width: b.width, height: StickerConstants.ContainerHeight) // Frame
        
        self.stickerNames = stickerNames
        super.init(frame: f)
        
        self.backgroundColor = UIColor.red
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        // Starting positions of StickerViews, with padding
        var x: CGFloat = 15.0
        let y: CGFloat = self.bounds.minY + 5.0
        
        // Loop through sticker names to get the image files to create StickerSources
        for i in stickerNames {
            let img: UIImage = UIImage(named: i)!
            let s: StickerSource = StickerSource(image: img, x: x, y: y)
            
            self.addSubview(s)
            
            x += s.bounds.width + 15.0 // Padding
        }
    }

}
