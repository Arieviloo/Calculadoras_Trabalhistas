import UIKit

class AdditionalView: UIView {
	
	private let percents = ["10%", "20%", "40%"]
	
	lazy var dangerousnessLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionDangerousnessAdditional")
		return $0
	}(UILabel())
	
	lazy var toggleDangerousnessSwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.isEnabled = true
		$0.onTintColor = UIColor.appGreenLight
		return $0
	}(UISwitch())
	
	lazy var insalubrityLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionInsalubrityAdditional")
		return $0
	}(UILabel())
	
	lazy var toggleInsalubritySwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.isEnabled = true
		$0.onTintColor = UIColor.appGreenLight
		return $0
	}(UISwitch())
	
	lazy var levelInsalybrityLabel: UILabel = {
		$0.setCustomTitleNormal(title: "questionLevelInsalubrity")
		return $0
	}(UILabel())
	
	lazy var btnSelect: UISegmentedControl = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.contentMode = .scaleAspectFill
		$0.backgroundColor = UIColor.appBlueLight
		$0.selectedSegmentTintColor = UIColor.appGreenLight
		return $0
	}(UISegmentedControl(items: percents))
	
	lazy var nextButton: UIButton = {
		$0.setCustomButton(title: "next", colorBackground: UIColor.appBlue)
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
	
	private func configAddView() {
		addSubview(dangerousnessLabel)
		addSubview(toggleDangerousnessSwitch)
		addSubview(insalubrityLabel)
		addSubview(toggleInsalubritySwitch)
		addSubview(levelInsalybrityLabel)
		addSubview(btnSelect)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			dangerousnessLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			dangerousnessLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			toggleDangerousnessSwitch.leadingAnchor.constraint(equalTo: dangerousnessLabel.trailingAnchor),
			toggleDangerousnessSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			toggleDangerousnessSwitch.centerYAnchor.constraint(equalTo: dangerousnessLabel.centerYAnchor),
			
			insalubrityLabel.topAnchor.constraint(equalTo: dangerousnessLabel.bottomAnchor, constant: 30),
			insalubrityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			toggleInsalubritySwitch.leadingAnchor.constraint(equalTo: insalubrityLabel.trailingAnchor),
			toggleInsalubritySwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			toggleInsalubritySwitch.centerYAnchor.constraint(equalTo: insalubrityLabel.centerYAnchor),
			
			levelInsalybrityLabel.topAnchor.constraint(equalTo: insalubrityLabel.bottomAnchor, constant: 30),
			levelInsalybrityLabel.leadingAnchor.constraint(equalTo: insalubrityLabel.leadingAnchor),
			levelInsalybrityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			btnSelect.topAnchor.constraint(equalTo: levelInsalybrityLabel.bottomAnchor, constant: 10),
			btnSelect.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			btnSelect.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
		])
	}
}
