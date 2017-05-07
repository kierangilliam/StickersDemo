//
//  CameraView.swift
//  StickersDemo
//
//  Created by User on 5/6/17.
//  Copyright © 2017 KieranGill. All rights reserved.
//

import UIKit

protocol CameraViewDataSource: class {
    
}


class CameraView: UIView {

    weak var dataSource: CameraViewDataSource?

}
