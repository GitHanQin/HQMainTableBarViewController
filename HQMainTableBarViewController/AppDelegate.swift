//
//  AppDelegate.swift
//  HQMainTableBarViewController
//
//  Created by 韩琴 on 2018/7/26.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //创建window
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HQMainTableBarViewController()
        vc.themColor = UIColor.red
        vc.barBackgroundColor = UIColor.white
        vc.childVcNames = ["HomeViewController","NullViewController","ViewController"]
        vc.imageNames = ["首页-选中-2","","我 的当选"]
        vc.selectedImageNames = ["首页-选中","","我 的当选-2"]
        vc.titles = ["首页","","我的"]
        vc.composeVCName = "ComposeViewController"
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 0.2*UIScreen.main.bounds.size.width, height: 0.2*UIScreen.main.bounds.size.width))
        button.setImage(UIImage.init(named: "发布"), for:   .normal)
        vc.composeBtn = button
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

