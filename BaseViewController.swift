//
//  BaseViewController.swift
//  HobbyApp
//
//  Created by Manish Mahajan on 20/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

struct Screen {
    static let height = UIScreen.main.bounds.size.height - 40
}

class BaseViewController: UIViewController {
    
    var nav: UIView = UIView()
    var bookList = ["Food & Drink", "Andoid Wear", "Art & Design", "Business", "Comic", "Communication", "Entertainment", "Andoid Wear"]
    var bookImage = ["coverPhoto", "videoImage", "playMy", "coverPhoto", "videoImage", "playMy", "playMy", "coverPhoto"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserDefaults(key: "userId", value: "12345" as AnyObject)
        // Do any additional setup after loading the view.
    }
    
    func hideNavigationView() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupNavigationView(vc: UIViewController, titleIndex: Int, leftImage: UIImage? = nil, rightImage: UIImage? = nil, rightLeftMostImage: UIImage? = nil) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let navigationView =  Bundle.main.loadNibNamed(NAVIGATION_VIEW, owner: self, options: nil)?[0] as! NavigationView
        if let title = AppTitles(rawValue: titleIndex) {
            navigationView.title.text = title.string
        }

//        Show/Hide left button
        if leftImage == nil {
            navigationView.leftButton.isHidden = true
        } else {
            navigationView.leftButton.setImage(leftImage, for: .normal)
        }
 
//        Show/Hide left button
        if rightLeftMostImage == nil {
            navigationView.rightLeftButton.isHidden = true
        } else {
            navigationView.rightLeftButton.setImage(rightLeftMostImage, for: .normal)
        }

//        Show/Hide left button
        if rightImage == nil {
            navigationView.rightButton.isHidden = true
        } else {
            navigationView.rightButton.setImage(rightImage, for: .normal)
        }
        
        navigationView.frame.size.width = UIScreen.main.bounds.size.width
        navigationView.delegate = vc as? NavigtionViewDelegate
        navigationView.viewController = vc
        self.view.addSubview(navigationView)
    }
    
    //Set string in user defaults
    func setUserDefaults(key: String, value: AnyObject) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    //Get user defaults string
    func getUserDefaults(key: String) -> AnyObject {
        let result = UserDefaults.standard.value(forKey: key)
        return result as AnyObject
    }
    
    //Set bool userDefaults
    func setBoolUserDefaults(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    //Get bool user defaults
    func getBoolUserDefaults(key: String) -> Bool {
        let result = UserDefaults.standard.value(forKey: key)
        return result as! Bool
    }
}
