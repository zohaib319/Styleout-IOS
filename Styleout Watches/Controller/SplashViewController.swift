//
//  SplashViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 08/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.gotoDashboard()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func gotoDashboard(){
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomerDashboardTabBar") as! CustomerDashboardTabBar
//        let navigationController = UINavigationController(rootViewController: nextViewController)
//        navigationController.modalPresentationStyle = .fullScreen
//               self.present(nextViewController, animated:true, completion:nil)
        self.performSegue(withIdentifier: "dashboardSegue", sender: self)
    }

}
