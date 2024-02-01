import UIKit

class VacationView: UIView {
	
	lazy var amountVacationLabel: UILabel = {
		$0.setCustomTitleNormal(title: "howManyDaysDfVacation")
		return $0
	}(UILabel())
	
	lazy var amountVacationTextField: UITextField = {
		$0.setCustomTextField()
		return $0
	}(UITextField())
	
	lazy var willSellVacationLabel: UILabel = {
		$0.setCustomTitleNormal(title: "willSellVacation")
		return $0
	}(UILabel())
	
	lazy var willSellVacationSwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.onTintColor = UIColor.appGreenLight
		$0.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
		$0.isEnabled = true
		$0.addTarget(self, action: #selector(tappedSellVacation), for: .touchUpInside)
		return $0
	}(UISwitch())
	
	lazy var homManyDaysLabel: UILabel = {
		$0.setCustomTitleNormal(title: "homManyDays")
		$0.isHidden = true
		return $0
	}(UILabel())
	
	lazy var homManyDaysTextField: UITextField = {
		$0.setCustomTextField()
		$0.isHidden = true
		return $0
	}(UITextField())
	
	lazy var willAnticipateThirteenthLabel: UILabel = {
		$0.setCustomTitleNormal(title: "willAnticipateThirteenth")
		return $0
	}(UILabel())
	
	lazy var willAnticipateThirteenthSwitch: UISwitch = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.onTintColor = UIColor.appGreenLight
		$0.isEnabled = true
		$0.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
//		$0.addTarget(self, action: #selector(tappedAdditionalInsalubrity), for: .touchUpInside)
		return $0
	}(UISwitch())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func tappedSellVacation() {
		if willSellVacationSwitch.isOn {
			homManyDaysLabel.isHidden = false
			homManyDaysTextField.isHidden = false
		} else {
			homManyDaysLabel.isHidden = true
			homManyDaysTextField.isHidden = true
		}
	}
	
	private func configAddView() {
		addSubview(amountVacationLabel)
		addSubview(amountVacationTextField)
		addSubview(willSellVacationLabel)
		addSubview(willSellVacationSwitch)
		addSubview(homManyDaysLabel)
		addSubview(homManyDaysTextField)
		addSubview(willAnticipateThirteenthLabel)
		addSubview(willAnticipateThirteenthSwitch)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			amountVacationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			amountVacationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			amountVacationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			amountVacationTextField.topAnchor.constraint(equalTo: amountVacationLabel.bottomAnchor, constant: 10),
			amountVacationTextField.leadingAnchor.constraint(equalTo: amountVacationLabel.leadingAnchor),
			amountVacationTextField.trailingAnchor.constraint(equalTo: amountVacationLabel.trailingAnchor),
			amountVacationTextField.heightAnchor.constraint(equalToConstant: 40),
			
			willAnticipateThirteenthLabel.topAnchor.constraint(equalTo: amountVacationTextField.bottomAnchor, constant: 40),
			willAnticipateThirteenthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			willAnticipateThirteenthSwitch.leadingAnchor.constraint(equalTo: willAnticipateThirteenthLabel.trailingAnchor),
			willAnticipateThirteenthSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			willAnticipateThirteenthSwitch.centerYAnchor.constraint(equalTo: willAnticipateThirteenthLabel.centerYAnchor),
			
			willSellVacationLabel.topAnchor.constraint(equalTo: willAnticipateThirteenthLabel.bottomAnchor, constant: 30),
			willSellVacationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			
			willSellVacationSwitch.leadingAnchor.constraint(equalTo: willSellVacationLabel.trailingAnchor),
			willSellVacationSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			willSellVacationSwitch.centerYAnchor.constraint(equalTo: willSellVacationLabel.centerYAnchor),
			
			homManyDaysLabel.topAnchor.constraint(equalTo: willSellVacationLabel.bottomAnchor, constant: 30),
			homManyDaysLabel.leadingAnchor.constraint(equalTo: amountVacationLabel.leadingAnchor),
			homManyDaysLabel.trailingAnchor.constraint(equalTo: amountVacationLabel.trailingAnchor),
			
			homManyDaysTextField.topAnchor.constraint(equalTo: homManyDaysLabel.bottomAnchor, constant: 10),
			homManyDaysTextField.leadingAnchor.constraint(equalTo: amountVacationLabel.leadingAnchor),
			homManyDaysTextField.trailingAnchor.constraint(equalTo: amountVacationLabel.trailingAnchor),
			homManyDaysTextField.heightAnchor.constraint(equalToConstant: 40),
		])
		
	}
}
