//
//  MDNavigationBar.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDNavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame);
 
        setBackgroundImage(UIImage(), for: .default);
        shadowImage = UIImage();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func menuPressed() {
        
    }
    
}
