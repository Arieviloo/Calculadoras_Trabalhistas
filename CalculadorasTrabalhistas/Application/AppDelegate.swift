//
//  AppDelegate.swift
//  CalculadorasTrabalhistas
//
//  Created by Jadië Oliveira on 08/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: AdditionalViewController())
		window?.makeKeyAndVisible()
		
		return true
	}

}

