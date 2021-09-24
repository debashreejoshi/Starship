//
//  AppDelegate.swift
//  Starship
//
//  Created by Debashree on 23/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setUpNav()
        self.setUpTabBarAppearance()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func setUpNav() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        // To apply textAttributes to title i.e. colour, font etc.
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor.init(hexString: "#4F6395")
        
        // To change colour of tappable items.
        UINavigationBar.appearance().tintColor = .white
        
        // To control navigation bar's translucency.
        UINavigationBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setUpTabBarAppearance() {
        UITabBar.appearance().tintColor = UIColor.init(hexString: "#4F6395")
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray
    }
}

