//
//  ViewController.swift
//  emi-calculator
//
//  Created by Kiran on 30/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Outlets
    
    
    
    
    //MARK: - Local Variables
    var currentValue = 0.0
    
    
    //MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.delegate = self
        
        currentValue = slider.currentValue
        valueLbl.text = String(format: "%.1f", currentValue)
    }


}

