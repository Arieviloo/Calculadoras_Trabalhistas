import UIKit

protocol RescissionViewProtocol: NSObject {
	func tappedNext()
}

class RescissionView: UIView {
	
	private weak var delegate: RescissionViewProtocol?
	
	public func delegate(delegate:RescissionViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var dateContractingLabel: UILabel = {
		$0.setCustomTitleNormal(title: "dateYourContracting")
		return $0
	}(UILabel())
	
	lazy var dateContractingTextField: UITextField = {
		$0.setCustomTextField()
		$0.placeholder = "dd / mm / aaaa"
		return $0
	}(UITextField())
	
	lazy var dateResignationLabel: UILabel = {
		$0.setCustomTitleNormal(title: "dateYourResignation")
		return $0
	}(UILabel())
	
	lazy var dateResignationTextField: UITextField = {
		$0.setCustomTextField()
		$0.placeholder = "dd / mm / aaaa"
		return $0
	}(UITextField())
	
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
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
		self.dateContractingTextField.delegate = delegate
		self.dateResignationTextField.delegate = delegate
	}
	
	@objc func tappedNext() {
		self.delegate?.tappedNext()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		addSubview(dateContractingLabel)
		addSubview(dateContractingTextField)
		addSubview(dateResignationLabel)
		addSubview(dateResignationTextField)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			dateContractingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			dateContractingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			dateContractingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			dateContractingTextField.topAnchor.constraint(equalTo: dateContractingLabel.bottomAnchor, constant: 10),
			dateContractingTextField.leadingAnchor.constraint(equalTo: dateContractingLabel.leadingAnchor),
			dateContractingTextField.trailingAnchor.constraint(equalTo: dateContractingLabel.trailingAnchor),
			dateContractingTextField.heightAnchor.constraint(equalToConstant: 40),
			
			dateResignationLabel.topAnchor.constraint(equalTo: dateContractingTextField.bottomAnchor, constant: 40),
			dateResignationLabel.leadingAnchor.constraint(equalTo: dateContractingLabel.leadingAnchor),
			dateResignationLabel.trailingAnchor.constraint(equalTo: dateContractingLabel.trailingAnchor),
			
			dateResignationTextField.topAnchor.constraint(equalTo: dateResignationLabel.bottomAnchor, constant: 10),
			dateResignationTextField.leadingAnchor.constraint(equalTo: dateContractingLabel.leadingAnchor),
			dateResignationTextField.trailingAnchor.constraint(equalTo: dateContractingLabel.trailingAnchor),
			dateResignationTextField.heightAnchor.constraint(equalToConstant: 40),
			
			nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
			
		])
		
	}
}
