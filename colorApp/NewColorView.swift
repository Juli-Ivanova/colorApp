//
//  NewColorView.swift
//  colorApp
//
//  Created by Юлия Иванова on 06.09.2020.
//  Copyright © 2020 Юлия Иванова. All rights reserved.
//

import UIKit

class NewColorView: UIViewController, ColorChangeDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SlidersViewController
        destinationVC.delegate = self
        destinationVC.bgColorView = view.backgroundColor
    }

    
    func didChangeColor(controller: SlidersViewController, color: UIColor) {
        self.view.backgroundColor = color
    }
    
 
}



