//
//  HomeViewController.swift
//  CustomTabBarSwift
//
//  Created by IAPPS on 22/4/21.
//
import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Helper.share.tabBarDelegate?.isHideTabBar(flag: false)
        
        
        manageProgressHUD()
        
    }
    
    func manageProgressHUD(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            ProgressHUD.colorAnimation = .blue
//
//            ProgressHUD.animationType = .lineScaling
//            ProgressHUD.animationType = .multipleCirclePulse
//            ProgressHUD.animationType = .circleRotateChase
//            ProgressHUD.animationType = .circleStrokeSpin
//            ProgressHUD.animationType = .circleStrokeSpin
//            ProgressHUD.animationType = .horizontalCirclesPulse
//            ProgressHUD.animationType = .lineScaling
//            ProgressHUD.animationType = .singleCirclePulse
//            ProgressHUD.animationType = .multipleCirclePulse
//            ProgressHUD.animationType = .circleSpinFade
            ProgressHUD.animationType = .circleRotateChase
            
            ProgressHUD.show("processing..")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            ProgressHUD.showSucceed()
            }
        }
        
    }
    
    
    func manageUI(){
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func pickBtnPressed(_ sender: Any) {
        
        guard let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "PickerViewController") as? PickerViewController else{
            return
        }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: pickerVcDelegate{
    func getValue(index: Int) {
        
        print("my value", index)
    }
}
