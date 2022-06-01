//
//  AbstractionLayer.swift
//  emi-calculator
//
//  Created by Kiran on 31/05/22.
//

import Foundation
import UIKit


class AbstractionLayer : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addGestures()
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.layer.cornerRadius = 20
       
        addConstraintsToViews(selectedView: 1)
//        generalConstraints()
    }
    
    func addSubViews() {
        self.addSubview(stack)
        self.addSubview(bottomView)
        self.addSubview(topLayer)
        self.addSubview(middleLayer)
        self.bringSubviewToFront(topLayer)
        self.bringSubviewToFront(middleLayer)
        self.bringSubviewToFront(bottomView)
    }
    
    
    func addGestures() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction1(_:)))
        view1.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction2(_:)))
        view2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapAction3(_:)))
        view3.addGestureRecognizer(tap3)
        let tapLayer1 = UITapGestureRecognizer(target: self, action: #selector(tapLayerAction1(_:)))
        topLayer.addGestureRecognizer(tapLayer1)
        let tapLayer2 =  UITapGestureRecognizer(target: self, action: #selector(tapLayerAction2(_:)))
        middleLayer.addGestureRecognizer(tapLayer2)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    lazy var view1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#243A73")
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        let label = UILabel()
        label.text = "hi Kiran"
        label.textColor = .white
        label.textAlignment = .left
        view.addSubview(label)
        return view
    }()
    
    lazy var view2 : UIView = {
        let view2 = UIView()
        view2.backgroundColor = .red
        return view2
    }()
    
    lazy var view3 : UIView = {
        let view3 = UIView()
        view3.backgroundColor = .green
        return view3
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [view1,view2,view3])
        stack.frame = self.bounds
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    lazy var bottomView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.frame.minX, y: self.frame.maxY - 100, width: self.frame.width, height: 100)
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        view.backgroundColor = .orange.withAlphaComponent(0.5)
        
        return view
    }()
    
    
    lazy var topLayer : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: 150)
        view.backgroundColor = .black.withAlphaComponent(0.25)
        return view
    }()
    
    lazy var middleLayer : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.bounds.minX, y: self.bounds.minY, width: self.bounds.width, height: 300)
        view.backgroundColor = .black.withAlphaComponent(0.25)
        return view
    }()
    
    
    @objc func tapAction1(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 1)
    }
    
    @objc func tapAction2(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 2)
    }
    
    @objc func tapAction3(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 3)
    }
    
    @objc func tapLayerAction1(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 1)
    }
    
    @objc func tapLayerAction2(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 2)
    }
    
    func addConstraintsToViews(selectedView : Int) {
        let heightConstraint1 = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        heightConstraint1.priority = UILayoutPriority(rawValue: 998)
        let heightConstraint2 = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        heightConstraint2.priority = UILayoutPriority(rawValue: 999)
        let heightConstraint3 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        heightConstraint3.priority = UILayoutPriority(rawValue: 997)
        let heightConstraint4 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: stack, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: self.stack.frame.height - 300)
        heightConstraint4.priority = UILayoutPriority(rawValue: 999)
        
        let topLayerTop = NSLayoutConstraint(item: topLayer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let topLayerBottom = NSLayoutConstraint(item: topLayer, attribute: .bottom, relatedBy: .equal, toItem: view1, attribute: .bottom, multiplier: 1, constant: 0)
        let middleLayerTop = NSLayoutConstraint(item: middleLayer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let middleLayerBottom = NSLayoutConstraint(item: middleLayer, attribute: .bottom, relatedBy: .equal, toItem: view3, attribute: .top, multiplier: 1, constant: 0)
        let middleLayerHeight = NSLayoutConstraint(item: middleLayer, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        middleLayerHeight.priority = UILayoutPriority(rawValue: 999)
        
        switch(selectedView) {
        case 1:
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("1 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            
            break
        case 2:
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint3, topLayerTop, topLayerBottom])
                print("2 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 3:
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = false
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint2,middleLayerTop])
                print("3 tapped")
                self.layoutSubviews()
                self.layoutIfNeeded()
            }, completion: nil)
            break
        default:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("1 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func generalConstraints() {
    
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
