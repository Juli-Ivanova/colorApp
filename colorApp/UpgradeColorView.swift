//
//  UpgradeColorView.swift
//  colorApp
//
//  Created by Юлия Иванова on 06.09.2020.
//  Copyright © 2020 Юлия Иванова. All rights reserved.
//

import UIKit

class UpgradeColorViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    
    func didChangeColor(controller: SlidersViewController, color: UIColor) {
        self.view.backgroundColor = color
    }
    
}

