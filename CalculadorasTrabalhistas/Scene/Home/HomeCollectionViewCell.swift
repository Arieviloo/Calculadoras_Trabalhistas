import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "HomeCollectionViewCell"
	
	lazy var calculatorButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = UIColor.appGray
//		$0.clipsToBounds = true
		$0.layer.cornerRadius = 15
		$0.layer.shadowOffset = CGSize(width: 3, height: 6)
		$0.layer.shadowRadius = 5
		$0.layer.shadowOpacity = 0.2
		$0.layer.shouldRasterize = true
		return $0
	}(UIButton())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		self.contentView.addSubview(calculatorButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			calculatorButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			calculatorButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			calculatorButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			calculatorButton.heightAnchor.constraint(equalToConstant: 140)
		])
	}
}
