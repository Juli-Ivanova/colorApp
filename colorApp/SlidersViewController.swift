//
//  ViewController.swift
//  colorApp
//
//  Created by Юлия Иванова on 06.09.2020.
//  Copyright © 2020 Юлия Иванова. All rights reserved.
//

import UIKit

 protocol ColorChangeDelegate {
    func didChangeColor(controller: SlidersViewController, color: UIColor)
}

class SlidersViewController: UIViewController {

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var viewColor: UIView!
    
    var delegate: ColorChangeDelegate?
    var bgColorView: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        self.navigationController?.isNavigationBarHidden = true

        viewColor.layer.cornerRadius = 15
        viewColor.backgroundColor = bgColorView
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
//      setColorView()
        setValue(for: redLabel, greenLabel, blueLabel)

    }

    @IBAction func rgbSlider(_ sender: UISlider) {
           switch sender.tag {
           case 0: redLabel.text = string(from: sender)
           case 1: greenLabel.text = string(from: sender)
           case 2: blueLabel.text = string(from: sender)
           default: break
           }
            
           setColorView()
       }
    

    @IBAction func colorButton(_ sender: UIButton) {

        guard let color = viewColor.backgroundColor else { return }
        delegate?.didChangeColor(controller: self, color: color)
        navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = false

    }

    //MARK: Private Methods
       
    private func setColorView() {
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
     private func string(from slider: UISlider) -> String {
           String(format: "%.2f", slider.value)
    }
    
}

