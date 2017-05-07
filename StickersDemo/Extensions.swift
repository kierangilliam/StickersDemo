//
//  Extensions.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    // Pulled from stack overflow
    func resizeImage(newHeight: CGFloat) -> UIImage {
        
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
