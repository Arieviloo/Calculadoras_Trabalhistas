import UIKit

protocol AdditionalViewProtocol: NSObject {
	func tappedAdditionalInsalubrity()
	func tappedNext()
}

class AdditionalView: UIView {
	
	private weak var delegate: AdditionalViewProtocol?
	public func delegate(delegate: AdditionalViewProtocol) {
		self.delegate = delegate
	}
	
	private let percents = ["10%", "20%", "40%"]
	
	lazy var dangerousnessLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionDangerousnessAdditional")
		return $0
	}(UILabel())
	
	lazy var toggleDangerousnessSwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
		$0.onTintColor = UIColor.appGreenLight
		$0.isEnabled = true
		return $0
	}(UISwitch())
	
	lazy var insalubrityLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionInsalubrityAdditional")
		return $0
	}(UILabel())
	
	lazy var toggleInsalubritySwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
		$0.onTintColor = UIColor.appGreenLight
		$0.isEnabled = true
		$0.addTarget(self, action: #selector(tappedAdditionalInsalubrity), for: .touchUpInside)
		
		return $0
	}(UISwitch())
	
	lazy var contentView: UIStackView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.axis = .vertical
		$0.isHidden = true
		return $0
	}(UIStackView())
	
	lazy var levelInsalybrityLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionLevelInsalubrity")
		return $0
	}(UILabel())
	
	lazy var btnSelect: UISegmentedControl = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.contentMode = .scaleAspectFill
		$0.backgroundColor = UIColor.appBlueLight
		$0.selectedSegmentTintColor = UIColor.appGreenLight
		$0.selectedSegmentIndex = 0
		return $0
	}(UISegmentedControl(items: percents))
	
	lazy var nextButton: UIButton = {
		$0.setCustomButton(title: "next", colorBackground: UIColor.appBlue)
		$0.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func tappedAdditionalInsalubrity() {
		self.delegate?.tappedAdditionalInsalubrity()
	}
	
	@objc func tappedNext() {
		self.delegate?.tappedNext()
	}
	
	public func isHiddenLevelInsalubrity(isOn: Bool) {
		self.contentView.isHidden = isOn
	}
	
	private func configAddView() {
		addSubview(dangerousnessLabel)
		addSubview(toggleDangerousnessSwitch)
		addSubview(insalubrityLabel)
		addSubview(toggleInsalubritySwitch)
		addSubview(contentView)
		contentView.addArrangedSubview(levelInsalybrityLabel)
		contentView.addArrangedSubview(btnSelect)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			dangerousnessLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			dangerousnessLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			toggleDangerousnessSwitch.leadingAnchor.constraint(equalTo: dangerousnessLabel.trailingAnchor),
			toggleDangerousnessSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			toggleDangerousnessSwitch.centerYAnchor.constraint(equalTo: dangerousnessLabel.centerYAnchor),
			
			insalubrityLabel.topAnchor.constraint(equalTo: dangerousnessLabel.bottomAnchor, constant: 40),
			insalubrityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			toggleInsalubritySwitch.leadingAnchor.constraint(equalTo: insalubrityLabel.trailingAnchor),
			toggleInsalubritySwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			toggleInsalubritySwitch.centerYAnchor.constraint(equalTo: insalubrityLabel.centerYAnchor),
			
			contentView.topAnchor.constraint(equalTo: insalubrityLabel.bottomAnchor, constant: 30),
			contentView.leadingAnchor.constraint(equalTo: insalubrityLabel.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			levelInsalybrityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			levelInsalybrityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			levelInsalybrityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			btnSelect.topAnchor.constraint(equalTo: levelInsalybrityLabel.bottomAnchor),
			btnSelect.leadingAnchor.constraint(equalTo: levelInsalybrityLabel.leadingAnchor),
			btnSelect.trailingAnchor.constraint(equalTo: levelInsalybrityLabel.trailingAnchor),
			
			nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
		])
	}
}
