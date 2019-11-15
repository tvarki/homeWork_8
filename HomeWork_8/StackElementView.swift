//
//  stackElementView.swift
//  HomeWork_8
//
//  Created by Дмитрий Яковлев on 14.11.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class StackElementView: UIView {
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stringLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate : StackViewDelegate?

    
    let kCONTENT_XIB_NAME = "StackElementView"
    
    
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
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        delegate?.deleteButtonPress(view: self)

    }
    
    
}


protocol StackViewDelegate: class{
    func deleteButtonPress(view: StackElementView)
}


extension UIView{
    func fixDelteInView(_ container: UIView!) -> Void{
              self.frame = container.frame;
              container.addSubview(self);
       }
}
