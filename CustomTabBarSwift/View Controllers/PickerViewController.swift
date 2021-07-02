//
//  PickerViewController.swift
//  CustomTabBarSwift
//
//  Created by IAPPS on 22/4/21.
//

import UIKit

class PickerViewController: UIViewController {

    var delegate: pickerVcDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.share.tabBarDelegate?.isHideTabBar(flag: true)
        delegate.getValue(index: 2)
        
        isCameFromPickerVC = true
        
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
}

protocol pickerVcDelegate {
    func getValue(index: Int)
}
