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
        self.addSubview(stack)
        self.addSubview(bottomView)
        self.bringSubviewToFront(bottomView)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.layer.cornerRadius = 20
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction1(_:)))
        view1.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction2(_:)))
        view2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapAction3(_:)))
        view3.addGestureRecognizer(tap3)
        addConstraintsToViews(selectedView: 1)
//        generalConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
  
   

    lazy var view1 : UIView = {
        let view = UIView()
        view.backgroundColor = .blue.withAlphaComponent(0.5)
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var view2 : UIView = {
        let view2 = UIView()
        view2.backgroundColor = .red.withAlphaComponent(0.5)
        return view2
    }()
    
    lazy var view3 : UIView = {
        let view3 = UIView()
        view3.backgroundColor = .green.withAlphaComponent(0.5)
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
        view.frame = CGRect(x: self.frame.minX, y: self.frame.maxY - 80, width: self.frame.width - 20, height: 80)
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        view.backgroundColor = .orange.withAlphaComponent(0.5)
       
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
    
    func addConstraintsToViews(selectedView : Int) {
        let heightConstraint1 = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        let heightConstraint2 = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        let heightConstraint3 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150)
        
        switch(selectedView) {
        case 1:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("1 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
           
            break
        case 2:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint3])
                print("2 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 3:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint2])
                print("3 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            break
        default:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.removeConstraint(heightConstraint1)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("default")
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func generalConstraints() {
        let heightConstraint = NSLayoutConstraint(item: self.bottomView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let leading = NSLayoutConstraint(item: self.bottomView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.leadingAnchor, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: self.bottomView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.trailingAnchor, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 0)
      
        self.bottomView.addConstraints([heightConstraint,leading,trailing])
        self.layoutIfNeeded()
    }
}


class TaskView: UIView {
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(self.firstView)
        stackView.addArrangedSubview(self.imageView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //    lazy var btnRemove: UIButton = {
    //        let btn = UIButton()
    //        btn.setTitle("Remove", for: .normal)
    //        btn.setTitleColor(.red, for: .normal)
    //        btn.layer.borderWidth = 0.5
    //        btn.layer.borderColor = UIColor.red.cgColor
    //        let constraint = btn.heightAnchor.constraint(equalToConstant: 30)
    //        constraint.isActive = true
    //        constraint.priority = UILayoutPriority(rawValue: 999)
    //
    //        btn.addTarget(self, action: #selector(btnRemoveTouchUpInside), for: .touchUpInside)
    //        return btn
    //    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10.0
        let constraint = view.heightAnchor.constraint(equalToConstant: self.frame.height * 0.25)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "man.png")
        return view
    }()

    
    
    lazy var firstView : UIView = {
        let view = UIView()
        let constraint = view.heightAnchor.constraint(equalToConstant: self.frame.height * 0.5)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        view.backgroundColor = .red
        return view
        
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Man.png"
        return lbl
    }()
    
    lazy var btnShow: UIButton = {
        let btn = UIButton()
        btn.setTitle("Hide", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnShowTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    //    let delegate: TaskViewDelegate
    
    init() {
        
        
        super.init(frame: .zero)
        backgroundColor = .lightGray
        addSubview(stackView)
        //        stackView.snp.makeConstraints { (make) in
        //            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10))
        //        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func btnShowTouchUpInside() {
        UIView.animate(withDuration: 0.2) {
            self.imageView.isHidden = !self.imageView.isHidden
        }
        
        if self.imageView.isHidden {
            btnShow.setTitle("Show", for: .normal)
        } else {
            btnShow.setTitle("Hide", for: .normal)
        }
    }
    
}



