//
//  AbstractionLayer.swift
//  emi-calculator
//
//  Created by Kiran on 31/05/22.
//

import Foundation
import UIKit


class AbstractionLayer : UIView {
    
    //MARK: - Local Variables
    var view1State : States = .firstViewExpanded
    var view2State : States = .secondViewCollapsed
    var view3State : States = .thirdViewCollapsed
    var stateNotHandled : Bool = false
    
    //MARK: - Initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addGestures()
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.layer.cornerRadius = 20
        
        addConstraintsToViews(selectedView: 4)
//        handlingStateChanges(selectedView: 1)
        //        generalConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Necessary Views
    
    lazy var view1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#525E75")
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 15
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label.text = view1State == .firstViewExpanded ? "hi Kiran, how much do you need?" : "credit amount"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hexString: "#DFDFDE")
        label.textAlignment = .left
        view.addSubview(label)
        
        
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 40)
        subLabel.text = view1State == .firstViewExpanded ? "move the dial and set any amount you need upto ₹ 487,891" : "₹1,50,000"
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.systemFont(ofSize: 16)
        subLabel.textColor = UIColor(hexString: "#8D8DAA")
        subLabel.textAlignment = .left
        view.addSubview(subLabel)
        return view
    }()
    
    lazy var view2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#525E75")
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 15
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label.text = view2State == .secondViewExpanded ? "how do you wish to repay?" : "EMI"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hexString: "#DFDFDE")
        label.textAlignment = .left
        view.addSubview(label)
        
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 40)
        subLabel.text = view2State == .secondViewExpanded ? "choose on of our recommended plans or make your own" : "₹4,247/mo"
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.systemFont(ofSize: 16)
        subLabel.textColor = UIColor(hexString: "#8D8DAA")
        subLabel.textAlignment = .left
        view.addSubview(subLabel)
        
        return view
    }()
    
    lazy var view3 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#525E75")
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 15
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label.text = "where should we send the money?"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hexString: "#DFDFDE")
        label.textAlignment = .left
        view.addSubview(label)
        
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 40)
        subLabel.text = "amount will be credited to this bank account, EMI will also be debited from this bank account"
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.systemFont(ofSize: 16)
        subLabel.textColor = UIColor(hexString: "#8D8DAA")
        subLabel.textAlignment = .left
        view.addSubview(subLabel)
        return view
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [view1,view2,view3])
        stack.frame = self.bounds
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        //        stack.spacing = 10
        //        stack.backgroundColor = UIColor(hexString: "354259")
        stack.backgroundColor = .black.withAlphaComponent(0.8)
        return stack
    }()
    
    lazy var bottomView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.frame.minX, y: self.frame.maxY - 80, width: self.frame.width, height: 80)
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(hexString: "#243A73")
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label.text = "Proceed to EMI Selection"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hexString: "#DFDFDE")
        label.textAlignment = .center
        view.addSubview(label)
        view.bringSubviewToFront(label)
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
    
    //MARK: - Class functions
    
    func addSubViews() {
        self.addSubview(stack)
        self.addSubview(bottomView)
        self.addSubview(topLayer)
        self.addSubview(middleLayer)
        self.bringSubviewToFront(middleLayer)
        self.bringSubviewToFront(topLayer)
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
        let bottomViewTap = UITapGestureRecognizer(target: self, action: #selector(bottomViewTapAction(_:)))
        bottomView.addGestureRecognizer(bottomViewTap)
    }
    
    @objc func tapAction1(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 1)
        handlingStateChanges(selectedView: 1)
    }
    
    @objc func tapAction2(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 2)
        handlingStateChanges(selectedView: 2)
    }
    
    @objc func tapAction3(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 3)
        handlingStateChanges(selectedView: 3)
    }
    
    @objc func tapLayerAction1(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 1)
        handlingStateChanges(selectedView: 1)
    }
    
    @objc func tapLayerAction2(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 2)
        handlingStateChanges(selectedView: 2)
    }
    
    @objc func bottomViewTapAction(_ sender: UITapGestureRecognizer? = nil) {
        if view1State == .firstViewExpanded {
            addConstraintsToViews(selectedView: 5)
            handlingStateChanges(selectedView: 2)
        } else if view2State == .secondViewExpanded {
            addConstraintsToViews(selectedView: 3)
            handlingStateChanges(selectedView: 3)
        } else {
            stateNotHandled = true
            handlingStateChanges(selectedView: 0)
            print("not handled")
        }
        
    }
    
    //MARK: - Functions which handle height and states
    
    func addConstraintsToViews(selectedView : Int) {
        let heightConstraint1 = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        heightConstraint1.priority = UILayoutPriority(rawValue: 998)
        let heightConstraint2 = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        heightConstraint2.priority = UILayoutPriority(rawValue: 999)
        let heightConstraint3 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        heightConstraint3.priority = UILayoutPriority(rawValue: 997)
        let heightConstraint4 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: stack, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: self.stack.frame.height - 300)
        heightConstraint4.priority = UILayoutPriority(rawValue: 999)
        
        let heightConstraint5 = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        let heightConstraint6 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        
        let topLayerTop = NSLayoutConstraint(item: topLayer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let topLayerBottom = NSLayoutConstraint(item: topLayer, attribute: .bottom, relatedBy: .equal, toItem: view1, attribute: .bottom, multiplier: 1, constant: 0)
        let middleLayerTop = NSLayoutConstraint(item: middleLayer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        
        switch(selectedView) {
        case 1:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("1st view tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            
            break
        case 2:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint3, topLayerTop, topLayerBottom])
                print("2nd view tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 3:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = false
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint2,middleLayerTop])
                print("3rd view tapped")
                self.layoutSubviews()
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 4:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint5,heightConstraint6])
                print("Bottom bar initial state")
                self.layoutSubviews()
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 5:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint6])
                print("bottom bar 1st tap")
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
    
    func handlingStateChanges(selectedView : Int) {
        switch (selectedView) {
        case 1:
            view1State = .firstViewExpanded
            view2State = .secondViewCollapsed
            view3State = .thirdViewCollapsed
            updateSubViews()
            break
        case 2:
            view1State = .firstViewCollapsed
            view2State = .secondViewExpanded
            view3State = .thirdViewCollapsed
            updateSubViews()
            break
        case 3:
            view1State = .firstViewCollapsed
            view2State = .secondViewCollapsed
            view3State = .thirdViewExpanded
            updateSubViews()
            break
        default:
            print("state not handled")
            updateSubViews()
            break
        }
        
    }
    
    func updateSubViews() {
        self.view1.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.view2.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.view3.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        
        self.bottomView.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        
        let label1 = UILabel()
        label1.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label1.text = view1State == .firstViewExpanded ? "hi Kiran, how much do you need?" : "credit amount"
        label1.font = UIFont.systemFont(ofSize: 20)
        label1.textColor = UIColor(hexString: "#DFDFDE")
        label1.textAlignment = .left
        self.view1.addSubview(label1)
        
        
        let subLabel1 = UILabel()
        subLabel1.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 40)
        subLabel1.text = view1State == .firstViewExpanded ? "move the dial and set any amount you need upto ₹ 487,891" : "₹1,50,000"
        subLabel1.numberOfLines = 0
        subLabel1.font = UIFont.systemFont(ofSize: 16)
        subLabel1.textColor = UIColor(hexString: "#8D8DAA")
        subLabel1.textAlignment = .left
        self.view1.addSubview(subLabel1)
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label2.text = view2State == .secondViewExpanded ? "how do you wish to repay?" : "EMI"
        label2.font = UIFont.systemFont(ofSize: 20)
        label2.textColor = UIColor(hexString: "#DFDFDE")
        label2.textAlignment = .left
        self.view2.addSubview(label2)
        
        let subLabel2 = UILabel()
        subLabel2.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 40)
        subLabel2.text = view2State == .secondViewExpanded ? "choose on of our recommended plans or make your own" : "₹4,247/mo"
        subLabel2.numberOfLines = 0
        subLabel2.font = UIFont.systemFont(ofSize: 16)
        subLabel2.textColor = UIColor(hexString: "#8D8DAA")
        subLabel2.textAlignment = .left
        self.view2.addSubview(subLabel2)
        
        
        let label3 = UILabel()
        label3.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label3.text = view3State == .thirdViewExpanded ? "where should we send the money?" : "Your accounts"
        label3.font = UIFont.systemFont(ofSize: 20)
        label3.textColor = UIColor(hexString: "#DFDFDE")
        label3.textAlignment = .left
        self.view3.addSubview(label3)
        
        let subLabel3 = UILabel()
        subLabel3.frame = CGRect(x: 20, y: 50, width: self.frame.width - 40, height: 40)
        subLabel3.text = view3State == .thirdViewExpanded ?  "amount will be credited to this bank account, EMI will also be debited from this bank account" : "select an account"
        subLabel3.numberOfLines = 0
        subLabel3.font = UIFont.systemFont(ofSize: 16)
        subLabel3.textColor = UIColor(hexString: "#8D8DAA")
        subLabel3.textAlignment = .left
        self.view3.addSubview(subLabel3)
        
        
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40 , height: 20)
        label.text = handleBottomBarLabelText()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hexString: "#DFDFDE")
        label.textAlignment = .center
        bottomView.addSubview(label)
        
        if stateNotHandled {
            let label = UILabel()
            label.frame = CGRect(x: 20, y: 45, width: self.frame.width - 40 , height: 20)
            label.text = "join CRED for full experience !" //I hope I join CRED too
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor(hexString: "#DFDFDE")
            label.textAlignment = .center
            bottomView.addSubview(label)
            stateNotHandled = false
        }
    }
    
    func handleBottomBarLabelText() -> String {
        if view1State == .firstViewExpanded {
            return "proceed to EMI selection"
        } else if view2State == .secondViewExpanded{
            return "select your bank account"
        } else {
            return "tap for 1-click KYC"
        }
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

enum States : String {
case firstViewCollapsed
case firstViewExpanded
case secondViewCollapsed
case secondViewExpanded
case thirdViewCollapsed
case thirdViewExpanded
}
