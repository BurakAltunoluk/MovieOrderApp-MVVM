//
//  tabbarController.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 27/09/2022.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector:#selector(doneResponse) , name: Notification.Name("done"), object: nil)
            
        NotificationCenter.default.addObserver(self, selector:#selector(tabbarBadgeValueDown) , name: Notification.Name("delete"), object: nil)
        
    }
    

    @objc func doneResponse() {
        self.selectedIndex = 1 }

    
    @objc func tabbarBadgeValueDown() {
    
        if var currentBadgeValue = Int(tabBar.items![1].badgeValue ?? "0") {
            if currentBadgeValue > 0 {
                currentBadgeValue -= 1
                if currentBadgeValue == 0 { self.tabBar.items![1].badgeValue = nil } else {
                    self.tabBar.items![1].badgeValue = "\(currentBadgeValue)"
                }
            }
          
        }
     
    
    }
    
}
