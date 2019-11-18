//
//  ViewController.swift
//  HomeWork_8
//
//  Created by Дмитрий Яковлев on 13.11.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//


import UIKit





class ViewController: UIViewController, PersonViewDelegate , StackViewDelegate {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var scrollView: UIStackView!
    @IBOutlet weak var personView: PersonView!
    @IBOutlet weak var stackView: UIStackView!
    
    //MARK:- Delegate functions
    func addButtonPress(text: String) {
        
        let sev = StackElementView()
        
        setStackViewHeight(count: stackView.subviews.count+1)
        sev.delegate = self
        sev.stringLabel.text = text
        stackView.addArrangedSubview(sev)
    }
    
    func deleteButtonPress(view: StackElementView) {
        stackView.subviews.forEach { (v) in
            guard let tmp: StackElementView = v as? StackElementView else {return}
            if view == tmp{
                setStackViewHeight(count: stackView.subviews.count-1)
                v.removeFromSuperview()
                return
            }}
    }
    
    //MARK:- Overrided functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personView.delegate = self
        setStackViewHeight(count: 0)
        
        //        let tmp = PersonView()
        //        tmp.delegate = self
        //        setStackViewHeight(count: stackView.subviews.count+1)
        //        stackView.addArrangedSubview(tmp)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Support functions
    
    func makeAlert(title: String , text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func setStackViewHeight(count : Int){
        stackView.height(constant:  CGFloat((count)*49))
    }
}

//MARK:- UIView extension

extension UIView {
    func height(constant: CGFloat) {
        setConstraint(value: constant, attribute: .height)
    }
    
    func width(constant: CGFloat) {
        setConstraint(value: constant, attribute: .width)
    }
    
    private func removeConstraint(attribute: NSLayoutConstraint.Attribute) {
        constraints.forEach {
            if $0.firstAttribute == attribute {
                removeConstraint($0)
            }
        }
    }
    
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute) {
        removeConstraint(attribute: attribute)
        let constraint =
            NSLayoutConstraint(item: self,
                               attribute: attribute,
                               relatedBy: NSLayoutConstraint.Relation.equal,
                               toItem: nil,
                               attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                               multiplier: 1,
                               constant: value)
        self.addConstraint(constraint)
    }
    
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
}

