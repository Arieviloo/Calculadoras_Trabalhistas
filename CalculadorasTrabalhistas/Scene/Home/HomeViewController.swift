//
//  ViewController.swift
//  CalculadorasTrabalhistas
//
//  Created by Jadië Oliveira on 08/12/23.
//

import UIKit

class HomeViewController: UIViewController {
	private let homeView = HomeView()
	private let calculators: [Calculator] = [
		Calculator(name: "salario", icon: "teste1"),
		Calculator(name: "salario", icon: "teste1"),
		Calculator(name: "salario", icon: "teste1"),
		Calculator(name: "salario", icon: "teste1"),
	]
	
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
		view.backgroundColor = .white
		self.homeView.configProtocolCollectionView(delegate: self, dataSource: self)
	}
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print(calculators.count)
		return calculators.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
			let widthFrame = CGFloat((self.view.frame.width / 2 ) - 15)
			return CGSize(width: widthFrame , height: 300)
		}
	
	
}

