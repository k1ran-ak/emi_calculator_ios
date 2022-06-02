//
//  AbstractionVC.swift
//  emi-calculator
//
//  Created by Kiran on 31/05/22.
//

import UIKit

class AbstractionVC: UIViewController{

   
    
   
    
    

    @IBOutlet weak var contentView: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let view = AbstractionLayer(frame: self.contentView.bounds)
        view.view1TitleTextEx = "Anush Kiran"
        view.setLabelValuesWhenExpanded(view1Title: "Hi", view1SubTitle: "Hello", view2Title: nil, view2Subtitle: nil, view3Title: nil, view3SubTitle: nil)
        view.setLabelValuesWhenCollapsed(view1Title: "How are you?", view1SubTitle: "I'm good", view2Title: nil, view2Subtitle: nil, view3Title: nil, view3SubTitle: nil)
        view.setBottomViewText(firstStateText: "Anush", secondStateText: "Kiran", thirdStateText: "AK")
        view.addSubViews()
        view.addGestures()
        self.contentView.addSubview(view)
    }


}
