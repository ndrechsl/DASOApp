//
//  MDTextfield.swift
//  DASO
//
//  Created by Trinh Ta on 12/21/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDTextfield: UITextField {
    init(frame: CGRect, placeHolder: String) {
        super.init(frame: frame);
        borderStyle = .none;
        self.placeholder = placeholder;
        let border = CALayer();
        let width = CGFloat(2.0);
        border.borderColor = UIColor.darkGray.cgColor;
        border.borderWidth = width;
        border.frame = CGRect(x: 0, y: self.frame.height - width, width: frame.width, height: frame.height);
        self.layer.addSublayer(border);
        self.layer.masksToBounds = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
