//
//  AppDelegate.swift
//  MadridShops
//
//  Created by jose luis sanchez-porro godoy on 07/09/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit
import CoreData
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var cds = CoreDataStack()
    var context: NSManagedObjectContext?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.context = cds.createContainer(dbName: "MadridShops").viewContext
       
        let nav = self.window?.rootViewController as! UINavigationController
        let mainVC = nav.topViewController as! MainViewController
        mainVC.context = self.context
        self.proxyApparence()
        return true
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let _ = self.context else { return }
        self.cds.saveContext(context: self.context!)
    }
    // proxy de apariencia. Cambiamos todo los colores de los componentes de la App
    
    func proxyApparence(){
        
        let AppBackGroundColor = UIColor.black
        let AppForetextColor = UIColor.white
        
        UINavigationBar.appearance().barTintColor = AppBackGroundColor
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().tintColor = AppForetextColor
        
        UITableView.appearance().backgroundColor = AppBackGroundColor
        UITableViewCell.appearance().backgroundColor = AppBackGroundColor
        UITableViewCell.appearance().tintColor = AppForetextColor
        
        UILabel.appearance().tintColor = AppForetextColor

        UITabBar.appearance().barTintColor = AppBackGroundColor
        UITabBar.appearance().tintColor = AppForetextColor
        UITabBar.appearance().barTintColor = AppForetextColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: CGFloat(10.0))!, NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: CGFloat(10.0))!, NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
    }

}

