import UIKit

protocol OtherAdditionalViewProtocol: NSObject {
	func tappedCalculate()
}

class OtherAdditionalView: UIView {
	
	private weak var delegate: OtherAdditionalViewProtocol?
	public func delegate(delegate: OtherAdditionalViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var otherDiscountLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionOtherDiscount")
		return $0
	}(UILabel())
	
	lazy var otherDiscountTextField: UITextField = {
		$0.setCustomTextField()
		return $0
	}(UITextField())
	
	lazy var otherAdditionalLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionOtherAdditional")
		return $0
	}(UILabel())
	
	lazy var optionalLabel: UILabel = {
		$0.setCustomTitleOptional(title: "optional")
		return $0
	}(UILabel())
	
	lazy var otherAdditionalTextField: UITextField = {
		$0.setCustomTextField()
		return $0
	}(UITextField())
	
	lazy var subtitleOtherAdditionalLabel: UILabel = {
		$0.setCustomSubtitle(subtitle: "subtitleQuestionOtherAdditional")
		return $0
	}(UILabel())
	
	lazy var calculateButton: UIButton = {
		$0.setCustomButton(title: "calculate", colorBackground: UIColor.appBlueHeavy)
		$0.addTarget(self, action: #selector(tappedCalculate), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		configAddSubview()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func tappedCalculate() {
		self.delegate?.tappedCalculate()
	}
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
		self.otherAdditionalTextField.delegate = delegate
		self.otherDiscountTextField.delegate = delegate
	}
	
	private func configAddSubview() {
		addSubview(otherDiscountLabel)
		addSubview(otherDiscountTextField)
		addSubview(otherAdditionalLabel)
		addSubview(optionalLabel)
		addSubview(otherAdditionalTextField)
		addSubview(subtitleOtherAdditionalLabel)
		addSubview(calculateButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			
			otherDiscountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			otherDiscountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			otherDiscountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			otherDiscountTextField.topAnchor.constraint(equalTo: otherDiscountLabel.bottomAnchor, constant: 10),
			otherDiscountTextField.leadingAnchor.constraint(equalTo: otherDiscountLabel.leadingAnchor),
			otherDiscountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			otherDiscountTextField.heightAnchor.constraint(equalToConstant: 40),
			
			otherAdditionalLabel.topAnchor.constraint(equalTo: otherDiscountTextField.bottomAnchor, constant: 40),
			otherAdditionalLabel.leadingAnchor.constraint(equalTo: otherDiscountLabel.leadingAnchor),
			
			optionalLabel.topAnchor.constraint(equalTo: otherAdditionalLabel.topAnchor),
			optionalLabel.leadingAnchor.constraint(equalTo: otherAdditionalLabel.trailingAnchor, constant: 5),
			
			otherAdditionalTextField.topAnchor.constraint(equalTo: otherAdditionalLabel.bottomAnchor, constant: 10),
			otherAdditionalTextField.leadingAnchor.constraint(equalTo: otherDiscountLabel.leadingAnchor),
			otherAdditionalTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			otherAdditionalTextField.heightAnchor.constraint(equalToConstant: 40),
			
			subtitleOtherAdditionalLabel.topAnchor.constraint(equalTo: otherAdditionalTextField.bottomAnchor, constant: 10),
			subtitleOtherAdditionalLabel.leadingAnchor.constraint(equalTo: otherDiscountLabel.leadingAnchor),
			subtitleOtherAdditionalLabel.trailingAnchor.constraint(equalTo: otherAdditionalTextField.trailingAnchor),
			
			calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			calculateButton.widthAnchor.constraint(equalToConstant: 160),
			calculateButton.heightAnchor.constraint(equalToConstant: 45),
		])
	}
}
