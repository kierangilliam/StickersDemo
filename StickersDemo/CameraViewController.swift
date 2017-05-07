//
//  CameraViewController.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    var stickerNames = ["star-icon", "flower-icon", "star-icon",
                        "flower-icon", "star-icon", "flower-icon",
                        "star-icon", "flower-icon"]
    var stickersContainer: StickersContainerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Camera View Loaded")
        
        stickersContainer = StickersContainerView(stickerNames: stickerNames)
        
        self.view.addSubview(stickersContainer)
        
    }

}
