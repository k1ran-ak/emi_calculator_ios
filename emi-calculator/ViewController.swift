//
//  ViewController.swift
//  emi-calculator
//
//  Created by Kiran on 30/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var stackHV: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var firstAbstractionLayer: UIView!
    @IBOutlet weak var secondAbstractionLayer: UIView!
    @IBOutlet weak var xMarkView: UIView!
    
    
    //MARK: - Local Variables
    var currentValue = 0.0
    
    
    
    //MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction1(_:)))
        firstView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction2(_:)))
        secondView.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapAction3(_:)))
        thirdView.addGestureRecognizer(tap3)
        let tapX = UITapGestureRecognizer(target: self, action: #selector(tapActionX(_:)))
        xMarkView.addGestureRecognizer(tapX)
        initViews()
    }
    
    
    //MARK: - Styling
    
    func initViews() {
        firstAbstractionLayer.isHidden = true
        secondAbstractionLayer.isHidden = true
        stackHV.clipsToBounds = true
        stackHV.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        stackHV.layer.cornerRadius = 20
        firstView.clipsToBounds = true
        firstView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        firstView.layer.cornerRadius = 20
        firstView.backgroundColor = .blue.withAlphaComponent(0.5)
        secondView.backgroundColor = .red.withAlphaComponent(0.5)
        thirdView.backgroundColor = .green.withAlphaComponent(0.5)
        
        initialState()
    }
    
    
    func initialState() {
        let heightConstraint2 = NSLayoutConstraint(item: self.secondView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint3 = NSLayoutConstraint(item: self.thirdView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        self.view.addConstraints([heightConstraint2,heightConstraint3])
        //        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
        //            self.view.removeConstraints([heightConstraint2])
        //
        //            self.view.layoutIfNeeded()
        //        }, completion: nil)
    }
    
    @objc func tapActionX(_ sender: UITapGestureRecognizer? = nil) {
        let heightConstraint1 = NSLayoutConstraint(item: self.firstView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint2 = NSLayoutConstraint(item: self.secondView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint3 = NSLayoutConstraint(item: self.thirdView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        self.view.removeConstraints([heightConstraint1,heightConstraint2,heightConstraint3])
        
    }
    
    @objc func tapAction1(_ sender: UITapGestureRecognizer? = nil) {
        let heightConstraint1 = NSLayoutConstraint(item: self.firstView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint2 = NSLayoutConstraint(item: self.secondView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint3 = NSLayoutConstraint(item: self.thirdView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.view.removeConstraints([heightConstraint1])
            self.view.addConstraints([heightConstraint2,heightConstraint3])
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    
    @objc func tapAction2(_ sender: UITapGestureRecognizer? = nil) {
        let heightConstraint1 = NSLayoutConstraint(item: self.firstView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint2 = NSLayoutConstraint(item: self.secondView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint3 = NSLayoutConstraint(item: self.thirdView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.view.removeConstraints([heightConstraint2])
            self.view.addConstraints([heightConstraint1,heightConstraint3])
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    
    @objc func tapAction3(_ sender: UITapGestureRecognizer? = nil) {
        let heightConstraint1 = NSLayoutConstraint(item: self.firstView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint2 = NSLayoutConstraint(item: self.secondView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        let heightConstraint3 = NSLayoutConstraint(item: self.thirdView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.stackHV!, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.2, constant: 0)
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.view.removeConstraints([heightConstraint3])
            self.view.addConstraints([heightConstraint1,heightConstraint2])
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
}

