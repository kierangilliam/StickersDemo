//
//  CameraViewController.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    var stickerImages = ["star-icon", "flower-icon", "star-icon", "flower-icon"]

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Camera View Loaded")
        
        let startingX = 0
        let startingY = UIScreen.main.bounds
        
        for i in stickerImages {
            let img: UIImage = UIImage(named: i)!
            let s: StickerView = StickerView(image: img, x: 200, y: 200)
        }
        
    }

}
