//
//  NavigationView.swift
//  HobbyApp
//
//  Created by Manish Mahajan on 26/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

protocol NavigtionViewDelegate {
    func didLeftButtonPress(sender: UIButton)
    func didRightButtonPress(searchBar: UISearchBar)
}

class NavigationView: UIView {

    var delegate: NavigtionViewDelegate?
    var viewController: UIViewController?
    @IBOutlet weak var rightLeftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.*/
    override func draw(_ rect: CGRect) {
         navigationView.addshadow(top: false, left: false, bottom: true, right: false, width: UIScreen.main.bounds.size.width)
    }
    override func awakeFromNib() {
//        navigationView.addshadow(top: false, left: false, bottom: true, right: false, width: UIScreen.main.bounds.size.width)
    }
    
    @IBAction func rightButtonAction(_ sender: Any) {
        delegate?.didRightButtonPress(searchBar: searchBar)
    }
    
    @IBAction func rightLeftMostButtonAction(_ sender: Any) {
    }
    
    @IBAction func leftButtonAction(_ sender: Any) {
        switch leftButton.imageView?.image {
        case #imageLiteral(resourceName: "menuIcon")?:
            delegate?.didLeftButtonPress(sender: leftButton)
        case #imageLiteral(resourceName: "backIcon")?:
            viewController?.navigationController?.popViewController(animated: true)
        default:
            leftButton.isHidden = true
        }
    }
}
