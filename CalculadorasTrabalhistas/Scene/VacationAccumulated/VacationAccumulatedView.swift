import UIKit

class VacationAccumulatedView: UIView {
	
	lazy var haveVacationAccumulatedLabel: UILabel = {
		$0.setCustomTitleNormal(title: "YouHaveVacationAccumulated")
		return $0
	}(UILabel())
	
	lazy var haveVacationAccumulatedSwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.onTintColor = UIColor.appGreenLight
		$0.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
//		$0.addTarget(self, action: #selector(tappedSellVacation), for: .touchUpInside)
		return $0
	}(UISwitch())
	
	lazy var homManyDaysLabel: UILabel = {
		$0.setCustomTitleNormal(title: "homManyDays")
//		$0.isHidden = true
		return $0
	}(UILabel())
	
	lazy var homManyDaysTextField: UITextField = {
		$0.setCustomTextField()
//		$0.isHidden = true
		return $0
	}(UITextField())
	
	lazy var calculateButton: UIButton = {
		$0.setCustomButton(title: "calculate", colorBackground: UIColor.appBlueHeavy)
//		$0.addTarget(self, action: #selector(tappedCalculate), for: .touchUpInside)
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
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
		homManyDaysTextField.delegate = delegate
	}
	
	private func configAddView() {
		addSubview(haveVacationAccumulatedLabel)
		addSubview(haveVacationAccumulatedSwitch)
		addSubview(homManyDaysLabel)
		addSubview(homManyDaysTextField)
		addSubview(calculateButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			haveVacationAccumulatedLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			haveVacationAccumulatedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			haveVacationAccumulatedSwitch.leadingAnchor.constraint(equalTo: haveVacationAccumulatedLabel.trailingAnchor),
			haveVacationAccumulatedSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			haveVacationAccumulatedSwitch.centerYAnchor.constraint(equalTo: haveVacationAccumulatedLabel.centerYAnchor),
			
			homManyDaysLabel.topAnchor.constraint(equalTo: haveVacationAccumulatedLabel.bottomAnchor, constant: 30),
			homManyDaysLabel.leadingAnchor.constraint(equalTo: haveVacationAccumulatedLabel.leadingAnchor),
			homManyDaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			homManyDaysTextField.topAnchor.constraint(equalTo: homManyDaysLabel.bottomAnchor, constant: 10),
			homManyDaysTextField.leadingAnchor.constraint(equalTo: haveVacationAccumulatedLabel.leadingAnchor),
			homManyDaysTextField.trailingAnchor.constraint(equalTo: homManyDaysLabel.trailingAnchor),
			homManyDaysTextField.heightAnchor.constraint(equalToConstant: 40),
			
			calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			calculateButton.widthAnchor.constraint(equalToConstant: 160),
			calculateButton.heightAnchor.constraint(equalToConstant: 45),
		])
		
	}
}
