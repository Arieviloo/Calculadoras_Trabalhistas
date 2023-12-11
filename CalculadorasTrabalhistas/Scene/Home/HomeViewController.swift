//
//  ViewController.swift
//  CalculadorasTrabalhistas
//
//  Created by Jadië Oliveira on 08/12/23.
//

import UIKit

class HomeViewController: UIViewController {
	private let homeView = HomeView()
	
	override func loadView() {
		view = homeView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	private func configView() {
		title = String(localizedKey: "titleHome")
		self.navigationController?.navigationBar.titleTextAttributes =  [ NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 24, weight: .bold)
		]
	}
}

