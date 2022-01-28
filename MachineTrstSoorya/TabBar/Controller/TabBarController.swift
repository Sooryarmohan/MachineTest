//
//  TabBarController.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initalSetUp()
    }
    //MARK:- Initial SetUp
    func initalSetUp(){
        // Setting of Font and size of the text which is unselected
        let tabBarItemApperance = UITabBarItem.appearance()
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Arial", size: 14)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        // When tab bar item is unselected color will change
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        // When tab bar item is selected color will change and set the text and font
        tabBarItemApperance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 14)!, NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], for: .selected)
    }

}
