//
//  MDButton.swift
//  DASO
//
//  Created by Trinh Ta on 12/26/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDButtonWithLabel: UIView {
    var label: MDLabel!;
    var button: UIButton!;
    override init(frame: CGRect) {
        super.init(frame: frame);
        createView();
        autolayout();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        label = MDLabel(frame: .zero, title: "");
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont(name: "Roboto-Regular.ttf", size: 12);
        label.textColor = UIColor.black;
        addSubview(label);
        
        button = UIButton(frame: .zero);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.backgroundColor = UIColor.clear;
        button.layer.cornerRadius = 1;
        button.layer.borderWidth = 2;
        button.layer.borderColor = UIColor.blue.cgColor;
        addSubview(button);
        
        
        
    }
    func autolayout(){
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true;
        label.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        

//        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
        button.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true;
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8.0).isActive = true;
   
        
    }
    
}
