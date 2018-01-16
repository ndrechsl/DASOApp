//
//  MenuBarTableView.swift
//  DASO
//
//  Created by Trinh Ta on 12/18/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit


protocol menuBarDelegate: class {
    func viewSelected(menuBar: MenuBarTableView, selectedView: String);
}


class MenuBarTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!;
    var delegate: menuBarDelegate?;
    let menu = ["Profile" ,"Play", "Performace", "Goals", "Community", "Settings"];
    let profileCellID = "profileCellID";
    let menuCellID = "menuCellID";
    override init(frame: CGRect) {
        super.init(frame: frame);
        tableView = UITableView(frame: self.frame);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        tableView.register(profileCell.self, forCellReuseIdentifier: profileCellID);
        tableView.register(menuCell.self, forCellReuseIdentifier: menuCellID);
        tableView.separatorStyle = .none;
        addSubview(tableView);
        
        autolayout();
        
    }
    
    func autolayout() {
        tableView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true;
        tableView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true;
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        tableView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count + 1;
//        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0 ) {
            let cell = tableView.dequeueReusableCell(withIdentifier: profileCellID) as! profileCell;
            return cell;
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellID) as! menuCell;
        cell.menuLb.text = menu[indexPath.row - 1];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.viewSelected(menuBar: self, selectedView: menu[indexPath.row]);
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 184;
        }
        return 48;
        
    }
}

class profileCell: UITableViewCell {
    
    var nameLb: MDLabel!;
    var pointLb:MDLabel!;
    var profileImage: UIImageView!;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        createView();
        autoLayout();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createView() {
        nameLb = MDLabel(frame: .zero, title: "Trinh Ta");
        nameLb.text = "Trinh Ta";
        nameLb.translatesAutoresizingMaskIntoConstraints = false;
        nameLb.font = UIFont(name: "Roboto-Medimum.ttf", size: FONT_SIZE)
        nameLb.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        nameLb.textColor = UIColor.black;
        nameLb.heightAnchor.constraint(equalToConstant: FONT_SIZE);
        
        
        
        pointLb = MDLabel(frame: .zero, title: "Scores: 348");
        pointLb.text = "Scores: 348";
        pointLb.translatesAutoresizingMaskIntoConstraints = false;
        pointLb.font = UIFont(name: "Roboto-Regular.ttf", size: FONT_SIZE);
        pointLb.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        pointLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
        pointLb.textColor = UIColor.lightGray;
        
        
        
        let frameImage = CGRect(x: INDENT, y: INDENT, width: 100, height: 100);
        let i = #imageLiteral(resourceName: "Image")
        profileImage = UIImageView();
        
        profileImage.contentMode = .scaleAspectFit ;
        profileImage.clipsToBounds = true;
        profileImage.frame = frameImage;
        profileImage.image = i;
      
        profileImage.layer.cornerRadius = frame.width / 2;
        profileImage.layer.masksToBounds = true;
        profileImage.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(profileImage);
        
        
    }
    
    
    func autoLayout() {
        
        self.translatesAutoresizingMaskIntoConstraints = false;
//        profileImage.widthAnchor.constraint(equalToConstant: 100);
//        profileImage.heightAnchor.constraint(equalToConstant: 100);
//        profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
//        profileImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
//        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: INDENT);
       

        let labelStackview = UIStackView(arrangedSubviews: [nameLb, pointLb]);
        labelStackview.spacing = 8;
        labelStackview.distribution = .equalSpacing;
        labelStackview.axis = .vertical;
        labelStackview.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(labelStackview);
        labelStackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        labelStackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
        labelStackview.topAnchor.constraint(equalTo: self.topAnchor, constant: profileImage.frame.height + INDENT).isActive = true;
//
        
       
    }
}

class menuCell: UITableViewCell {
    var menuLb: MDLabel!;
    var menuImage: UIImageView!;
    let MENU_IMAGE_SIZE = CGFloat(24);
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        createVew();
        autoLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createVew() {
     
        menuImage = UIImageView();
        menuImage.image = #imageLiteral(resourceName: "Image");
        menuImage.contentMode = .scaleAspectFit;
        menuImage.clipsToBounds = true;
        let frame = CGRect(x: 0, y: 0 , width: MENU_IMAGE_SIZE , height: MENU_IMAGE_SIZE);
        menuImage.frame = frame;
        menuImage.translatesAutoresizingMaskIntoConstraints = false;
       
        self.addSubview(menuImage);
        
        menuLb = MDLabel(frame: .zero, title: "Perfomace");
        menuLb.text = "Performace";
        menuLb.font = UIFont(name: "Roboto-Medium", size: FONT_SIZE);
        menuLb.textColor = UIColor.black;
        menuLb.translatesAutoresizingMaskIntoConstraints = false;
        menuLb.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT - 72).isActive = true;
        menuLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
        self.addSubview(menuLb);

    }
    
    
    func autoLayout() {
//        self.translatesAutoresizingMaskIntoConstraints = false;
        
        menuImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        menuImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        menuImage.widthAnchor.constraint(equalToConstant: MENU_IMAGE_SIZE).isActive = true;
        menuImage.heightAnchor.constraint(equalToConstant: MENU_IMAGE_SIZE).isActive = true;
        
        
        menuLb.translatesAutoresizingMaskIntoConstraints = false;
        menuLb.leadingAnchor.constraint(equalTo: self.menuImage.trailingAnchor, constant: 40).isActive = true;
        menuLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT);
        menuLb.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        
    }
    
    
}


