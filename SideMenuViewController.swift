//
//  SideMenuViewController.swift
//  
//
//  Created by Admin on 05/05/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SideMenuViewController: BaseViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sideMenuTableView: UITableView!
    var menuLabels = ["Home", "Product Reviews", "Quiz", "Search","Logout"]
    var menuIcons = ["homeIcon", "reviewIcon", "quizIcon", "quizIcon", "logoutIcon"]
    var menuImageNames = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTableView.initializeTableView(rowHeight: 49, vc: self, cellIdentifier: "sideMenuCell", cell: "SideMenuTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationView()
    }
}

//Table view delegate and Data source methods
extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! SideMenuTableViewCell
        cell.menuLabel.text = menuLabels[indexPath.row]
        cell.menuImage.image = UIImage(named: menuIcons[indexPath.row])
        cell.selectionStyle = .none;
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        let revealVC = revealViewController
        revealVC.setFrontViewPosition(FrontViewPosition.left, animated: true)
        
        switch indexPath.row {
        case 0:
            let viewController = UINavigationController(rootViewController: ExploreViewController())
            viewController.hidesBottomBarWhenPushed = false
            revealVC.pushFrontViewController(viewController, animated: true)
        case 1:
            let viewController = UINavigationController(rootViewController: BottonNavigationViewController())
            viewController.pushViewController(ProductListViewController(), animated: true)
            viewController.hidesBottomBarWhenPushed = false
            revealVC.pushFrontViewController(viewController, animated: true)
        case 2:
            let viewController = UINavigationController(rootViewController: QuizCardViewController())
            revealVC.pushFrontViewController(viewController, animated: true)
        case 3:
            let viewController = UINavigationController(rootViewController: SearchViewController())
            revealVC.pushFrontViewController(viewController, animated: true)
        default:
            if let window = UIApplication.shared.keyWindow {
                let sbvc = SideMenuViewController()
                let menuVC = UINavigationController(rootViewController: sbvc)
                let home = LoginViewController()
                let nav = UINavigationController(rootViewController: home)
                let revealController = SWRevealViewController(rearViewController: menuVC, frontViewController: nav)
                window.rootViewController = revealController
            }
        }
    }
}
