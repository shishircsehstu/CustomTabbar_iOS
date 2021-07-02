//
//  TabBarViewController.swift
//  CustomTabBarSwift
//
//  Created by IAPPS on 22/4/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var index: Int!{
        didSet{
            indexSet()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBar()
    }
    
    func indexSet(){
        selectedIndex = index
    }
    func setupTabBar (){
        
        guard let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{
            return
        }
        
        let firstItem = UINavigationController.init(rootViewController: homeVC)
        
        guard let historyVC = UIStoryboard(name: "History", bundle: nil).instantiateViewController(identifier: "HistoryViewController") as? HistoryViewController else{
            return
        }
        let secondItem = UINavigationController.init(rootViewController: historyVC)
        
        guard let favouriteVC = UIStoryboard(name: "Favourite", bundle: nil).instantiateViewController(identifier: "FavouriteViewController") as? FavouriteViewController else{
            return
        }
        
        let thirdItem = UINavigationController.init(rootViewController: favouriteVC)
        
        guard let settingsVC = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else{
            return
        }
        
        let fourthItem = UINavigationController.init(rootViewController: settingsVC)
        let tabBarItemList = [firstItem, secondItem, thirdItem,fourthItem]
        
        self.viewControllers = tabBarItemList
        
    }
}

extension TabBarViewController: UITabBarControllerDelegate  {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false // Make sure you want this as false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.beginFromCurrentState], completion: nil)
            //transitionCrossDissolve
        }
        
        return true
    }
}
