//
//  PersonView.swift
//  HomeWork_8
//
//  Created by Дмитрий Яковлев on 14.11.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class PersonView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    
    weak var delegate : PersonViewDelegate?
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var stringTextField: UITextField!
    
    
    
    
    let kCONTENT_XIB_NAME = "PersonView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard stringTextField.text != nil else {return}
        guard stringTextField.text != "" else {return}

        delegate?.addButtonPress(text: (stringTextField.text)!)
    }
    
    
}

protocol PersonViewDelegate: class{
    func addButtonPress(text : String)
}
