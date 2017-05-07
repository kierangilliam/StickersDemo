//
//  Protocols.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

protocol Sticker: class {
    var image: UIImage { get set }
    init(image: UIImage, x: CGFloat, y: CGFloat)
}

protocol Draggable: class {
    func scale(_ gesture: UIPinchGestureRecognizer)
    func rotate(_ gesture: UIRotationGestureRecognizer) 
    func move(_ gesture: UIPanGestureRecognizer) 
}
