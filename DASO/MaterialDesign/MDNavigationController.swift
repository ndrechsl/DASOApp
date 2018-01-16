//
//  MDNavigationController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDNavigationController: UINavigationController, UINavigationControllerDelegate {
    private var menuIsShow = false;
    private var menuBar: MenuBarTableView!;
   override var viewControllers: [UIViewController] {
        didSet {
          
        }
    }
    
    
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: MDNavigationBar.self, toolbarClass: toolbarClass)
        setupNavigationBar();
        createMenuBar();
        print("vv")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        
        

    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
       
        
    }
  
    func setupNavigationBar() {
        navigationController?.navigationItem.hidesBackButton = true;
        let menuButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(menuPressed));
        navigationController?.navigationItem.leftBarButtonItem = menuButton;
        if(navigationController == nil) {
            print("navagiation bar is nil")
        }
        
    }
    
    func createMenuBar() {
        menuBar = MenuBarTableView(frame: self.view.frame);
        view.addSubview(menuBar);
        menuBar.isHidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuPressed() {
        if (!menuIsShow) {
            menuBar.isHidden = false;
        }
        else {
            menuBar.isHidden = true;
        }
        menuIsShow = !menuIsShow;
    }
    
    
    
}
