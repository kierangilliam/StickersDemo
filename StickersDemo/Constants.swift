//
//  Constants.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

struct StickerConstants {
    static let Bounds = UIScreen.main.bounds
    static let NumberOfStickers : CGFloat = 6.0
    static let StickerWidth : CGFloat = CGFloat(Bounds.width / NumberOfStickers)
    static let StickerHeight : CGFloat = CGFloat(Bounds.height / 5) // Stickers start at 1/5 size of screen
    static let ScaleWidthFactor : CGFloat = 0.4
    static let ScaleHeightFactor : CGFloat = 0.4
    
}
