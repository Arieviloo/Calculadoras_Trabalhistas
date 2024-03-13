import UIKit

protocol ListReasonViewProtocol: NSObject {
	func tappedNext()
}

class ListReasonView: UIView {
	
	private weak var delegate: ListReasonViewProtocol?
	
	public func delegate(delegate:ListReasonViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var dateContractingLabel: UILabel = {
		$0.setCustomTitleNormal(title: "selectReasonYourResignation")
		return $0
	}(UILabel())
	
	lazy var nextButton: UIButton = {
		$0.setCustomButton(title: "next", colorBackground: UIColor.appBlue)
		$0.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor =  .white
		configAddView()
		configConstraints()
	}
	
	
	@objc func tappedNext() {
		self.delegate?.tappedNext()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		addSubview(dateContractingLabel)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			dateContractingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			dateContractingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			dateContractingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
			
		])
		
	}
}
