import UIKit

class HomeView: UIView {
	
	lazy var calculatorCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .none
		$0.setCollectionViewLayout(layout, animated: true)
		$0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
		return $0
		
	}(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configProtocolCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
		calculatorCollectionView.delegate = delegate
		calculatorCollectionView.dataSource = dataSource
	}
	
	private func configAddView() {
		addSubview(calculatorCollectionView)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			calculatorCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			calculatorCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			calculatorCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			calculatorCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
		])
	}
	
}
