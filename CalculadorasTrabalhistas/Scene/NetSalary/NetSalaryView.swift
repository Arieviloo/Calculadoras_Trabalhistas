import UIKit

class NetSalaryView: UIView {
	
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
	
	@objc
	func tappedCalculate() {
		print("tapped")
	}
	
	private func configAddSubview() {
		addSubview(otherAdditionalLabel)
		addSubview(optionalLabel)
		addSubview(otherAdditionalTextField)
		addSubview(subtitleOtherAdditionalLabel)
		addSubview(calculateButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			otherAdditionalLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			otherAdditionalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			optionalLabel.topAnchor.constraint(equalTo: otherAdditionalLabel.topAnchor),
			optionalLabel.leadingAnchor.constraint(equalTo: otherAdditionalLabel.trailingAnchor, constant: 5),
			
			otherAdditionalTextField.topAnchor.constraint(equalTo: otherAdditionalLabel.bottomAnchor, constant: 10),
			otherAdditionalTextField.leadingAnchor.constraint(equalTo: otherAdditionalLabel.leadingAnchor),
			otherAdditionalTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			otherAdditionalTextField.heightAnchor.constraint(equalToConstant: 40),
			
			subtitleOtherAdditionalLabel.topAnchor.constraint(equalTo: otherAdditionalTextField.bottomAnchor, constant: 10),
			subtitleOtherAdditionalLabel.leadingAnchor.constraint(equalTo: otherAdditionalLabel.leadingAnchor),
			subtitleOtherAdditionalLabel.trailingAnchor.constraint(equalTo: otherAdditionalTextField.trailingAnchor),
			
			calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			calculateButton.widthAnchor.constraint(equalToConstant: 160),
			calculateButton.heightAnchor.constraint(equalToConstant: 45),
		])
	}
}
