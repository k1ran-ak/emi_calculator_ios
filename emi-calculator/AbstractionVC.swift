//
//  AbstractionVC.swift
//  emi-calculator
//
//  Created by Kiran on 31/05/22.
//

import UIKit

class AbstractionVC: UIViewController {
    

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = AbstractionLayer(frame: self.contentView.bounds)
        self.contentView.addSubview(view)
    }
    


}
