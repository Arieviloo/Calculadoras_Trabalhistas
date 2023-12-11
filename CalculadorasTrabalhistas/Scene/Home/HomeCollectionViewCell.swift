import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "HomeCollectionViewCell"
	
	lazy var calculatorButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .red
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
			calculatorButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			calculatorButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			calculatorButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
}
