//
//  PersonView.swift
//  HomeWork_8
//
//  Created by Дмитрий Яковлев on 14.11.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

//MARK:- Delegate protocol


class PersonView: UIView {
    
//MARK:- class IBOutlets

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stringTextField: UITextField!
    
//MARK:- variables

    weak var delegate : PersonViewDelegate?
    let kCONTENT_XIB_NAME = "PersonView"
    
//MARK:- All for class init

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
    
//MARK:- IBActions

    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard stringTextField.text != nil else {return}
        guard stringTextField.text != "" else {return}

        delegate?.addButtonPress(text: (stringTextField.text)!)
    }
    
}

