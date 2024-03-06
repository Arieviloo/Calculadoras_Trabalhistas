import UIKit

protocol VacationResultViewProtocol: NSObject {
	func tappedSimulateAgainButton()
	func tappedOtherCalculationButton()
}

class VacationResultView: UIView {
	
	private var delegate: VacationResultViewProtocol?
	func delegate(delegate: VacationResultViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = "Férias"
		$0.font = UIFont(name: "Montserrat-light", size: 20)
		
		return $0
	}(UILabel())
	
	lazy var contentView:UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = UIColor.appBlueLight
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 20
		return $0
	}(UIView())
	
	lazy var yourEarningsLabel: UILabel = {
		$0.setTextStrong(title: "yourEarnings", color:  UIColor.appGreen)
		return $0
	}(UILabel())
	
	lazy var salaryVacationLabel: UILabel = {
		$0.setTextSmall(title: "salaryVacation")
		return $0
	}(UILabel())
	
	lazy var valueSalaryVacationLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var oneThirdVacationLabel: UILabel = {
		$0.setTextSmall(title: "oneThirdVacation")
		return $0
	}(UILabel())
	
	lazy var valueOneThirdVacationLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var allowanceMonetaryLabel: UILabel = {
		$0.setTextSmall(title: "allowanceMonetary")
		return $0
	}(UILabel())
	
	lazy var valueAllowanceMonetaryLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var oneThirdAllowanceMonetaryLabel: UILabel = {
		$0.setTextSmall(title: "oneThirdAllowanceMonetary")
		return $0
	}(UILabel())
	
	lazy var valueOneThirdAllowanceMonetaryLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())	
	
	lazy var advancedThirteenthLabel: UILabel = {
		$0.setTextSmall(title: "advancedThirteenth")
		return $0
	}(UILabel())
	
	lazy var valueAdvancedThirteenthLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var additionalDangeroussLabel: UILabel = {
		$0.setTextSmall(title: "additionalDangerouss")
		return $0
	}(UILabel())
	
	lazy var valueAdditionalDangeroussLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var additionalInsalubrityLabel: UILabel = {
		$0.setTextSmall(title: "additionalInsalubrity")
		return $0
	}(UILabel())
	
	lazy var valueAdditionalInsalubrityLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var otherAdditionalLabel: UILabel = {
		$0.setTextSmall(title: "otherAdditional")
		return $0
	}(UILabel())
	
	lazy var valueOtherAdditionalLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var yourDiscountsLabel: UILabel = {
		$0.setTextStrong(title: "yourDiscounts", color: UIColor.appRed)
		return $0
	}(UILabel())
	
	lazy var inssLabel: UILabel = {
		$0.setTextSmall(title: "inss")
		return $0
	}(UILabel())
	
	lazy var valueInssLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var irrfLabel: UILabel = {
		$0.setTextSmall(title: "irrf")
		return $0
	}(UILabel())
	
	lazy var valueIrrfLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var otherDiscountsLabel: UILabel = {
		$0.setTextSmall(title: "otherDiscounts")
		return $0
	}(UILabel())
	
	lazy var valueOtherDiscountsLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		return $0
	}(UILabel())
	
	lazy var resultLabel: UILabel = {
		$0.setTextStrong(title: "Seu salário líquido será de", color: UIColor.appBlue)
		return $0
	}(UILabel())
	
	lazy var valueResultLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-ExtraBold", size: 20)
		$0.textColor = UIColor.appBlue
		return $0
	}(UILabel())
	
	lazy var simulateAgainButton: UIButton = {
		$0.setCustomButton(title: "simulateAgain", colorBackground: UIColor.appBlueLight)
		$0.addTarget(self, action: #selector(tappedSimulateAgainButton), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	lazy var otherCalculationButton: UIButton = {
		$0.setCustomButton(title: "doAnotherCalculation", colorBackground: UIColor.appBlueHeavy)
		$0.addTarget(self, action: #selector(tappedOtherCalculationButton), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	@objc func tappedSimulateAgainButton() {
		self.delegate?.tappedSimulateAgainButton()
	}
	@objc func tappedOtherCalculationButton() {
		self.delegate?.tappedOtherCalculationButton()
	}
	
	public func setValueEarning(grossSalary: String, dangerouss: String, insalubrity: String, otherAdditional: String) {
		valueSalaryVacationLabel.text = grossSalary
		valueAdditionalDangeroussLabel.text = dangerouss
		valueAdditionalInsalubrityLabel.text = insalubrity
		valueOtherAdditionalLabel.text = otherAdditional
	}
//	
//	public func setValueDiscount(inss: String, irrf: String, otherDiscount: String) {
//		valueInssLabel.text = inss
//		valueIrrfLabel.text = irrf
//		valueOtherDiscountsLabel.text = otherDiscount
//	}
	
	public func setValueResult(result: String) {
		valueResultLabel.text = result
	}
	
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
		addSubview(titleLabel)
		addSubview(contentView)
		contentView.addSubview(yourEarningsLabel)
		contentView.addSubview(salaryVacationLabel)
		contentView.addSubview(valueSalaryVacationLabel)
		contentView.addSubview(oneThirdVacationLabel)
		contentView.addSubview(valueOneThirdVacationLabel)
		contentView.addSubview(allowanceMonetaryLabel)
		contentView.addSubview(valueAllowanceMonetaryLabel)
		contentView.addSubview(oneThirdAllowanceMonetaryLabel)
		contentView.addSubview(valueOneThirdAllowanceMonetaryLabel)
		contentView.addSubview(advancedThirteenthLabel)
		contentView.addSubview(valueAdvancedThirteenthLabel)
		
		contentView.addSubview(additionalDangeroussLabel)
		contentView.addSubview(valueAdditionalDangeroussLabel)
		contentView.addSubview(additionalInsalubrityLabel)
		contentView.addSubview(valueAdditionalInsalubrityLabel)
		contentView.addSubview(otherAdditionalLabel)
		contentView.addSubview(valueOtherAdditionalLabel)
		
		contentView.addSubview(yourDiscountsLabel)
		contentView.addSubview(inssLabel)
		contentView.addSubview(valueInssLabel)
		contentView.addSubview(irrfLabel)
		contentView.addSubview(valueIrrfLabel)
		contentView.addSubview(otherDiscountsLabel)
		contentView.addSubview(valueOtherDiscountsLabel)
		contentView.addSubview(resultLabel)
		contentView.addSubview(valueResultLabel)
		addSubview(simulateAgainButton)
		addSubview(otherCalculationButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
			
			contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 440),
			
			yourEarningsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			yourEarningsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			yourEarningsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			salaryVacationLabel.topAnchor.constraint(equalTo: yourEarningsLabel.bottomAnchor, constant: 10),
			salaryVacationLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
		
			valueSalaryVacationLabel.centerYAnchor.constraint(equalTo: salaryVacationLabel.centerYAnchor),
			valueSalaryVacationLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			oneThirdVacationLabel.topAnchor.constraint(equalTo: salaryVacationLabel.bottomAnchor, constant: 10),
			oneThirdVacationLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
		
			valueOneThirdVacationLabel.centerYAnchor.constraint(equalTo: oneThirdVacationLabel.centerYAnchor),
			valueOneThirdVacationLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			allowanceMonetaryLabel.topAnchor.constraint(equalTo: oneThirdVacationLabel.bottomAnchor, constant: 10),
			allowanceMonetaryLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
		
			valueAllowanceMonetaryLabel.centerYAnchor.constraint(equalTo: allowanceMonetaryLabel.centerYAnchor),
			valueAllowanceMonetaryLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			oneThirdAllowanceMonetaryLabel.topAnchor.constraint(equalTo: allowanceMonetaryLabel.bottomAnchor, constant: 10),
			oneThirdAllowanceMonetaryLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
		
			valueOneThirdAllowanceMonetaryLabel.centerYAnchor.constraint(equalTo: oneThirdAllowanceMonetaryLabel.centerYAnchor),
			valueOneThirdAllowanceMonetaryLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			advancedThirteenthLabel.topAnchor.constraint(equalTo: oneThirdAllowanceMonetaryLabel.bottomAnchor, constant: 10),
			advancedThirteenthLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
		
			valueAdvancedThirteenthLabel.centerYAnchor.constraint(equalTo: advancedThirteenthLabel.centerYAnchor),
			valueAdvancedThirteenthLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			additionalDangeroussLabel.topAnchor.constraint(equalTo: advancedThirteenthLabel.bottomAnchor, constant: 10),
			additionalDangeroussLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueAdditionalDangeroussLabel.centerYAnchor.constraint(equalTo: additionalDangeroussLabel.centerYAnchor),
			valueAdditionalDangeroussLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			additionalInsalubrityLabel.topAnchor.constraint(equalTo: additionalDangeroussLabel.bottomAnchor, constant: 10),
			additionalInsalubrityLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueAdditionalInsalubrityLabel.topAnchor.constraint(equalTo: additionalInsalubrityLabel.topAnchor),
			valueAdditionalInsalubrityLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			otherAdditionalLabel.topAnchor.constraint(equalTo: additionalInsalubrityLabel.bottomAnchor, constant: 10),
			otherAdditionalLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueOtherAdditionalLabel.topAnchor.constraint(equalTo: otherAdditionalLabel.topAnchor),
			valueOtherAdditionalLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			yourDiscountsLabel.topAnchor.constraint(equalTo: otherAdditionalLabel.bottomAnchor, constant: 20),
			yourDiscountsLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			yourDiscountsLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			inssLabel.topAnchor.constraint(equalTo: yourDiscountsLabel.bottomAnchor, constant: 10),
			inssLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueInssLabel.centerYAnchor.constraint(equalTo: inssLabel.centerYAnchor),
			valueInssLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			irrfLabel.topAnchor.constraint(equalTo: inssLabel.bottomAnchor, constant: 10),
			irrfLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueIrrfLabel.centerYAnchor.constraint(equalTo: irrfLabel.centerYAnchor),
			valueIrrfLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			otherDiscountsLabel.topAnchor.constraint(equalTo: irrfLabel.bottomAnchor, constant: 10),
			otherDiscountsLabel.leadingAnchor.constraint(equalTo: yourEarningsLabel.leadingAnchor),
			
			valueOtherDiscountsLabel.centerYAnchor.constraint(equalTo: otherDiscountsLabel.centerYAnchor),
			valueOtherDiscountsLabel.trailingAnchor.constraint(equalTo: yourEarningsLabel.trailingAnchor),
			
			resultLabel.topAnchor.constraint(equalTo: valueOtherDiscountsLabel.bottomAnchor, constant: 30),
			resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			valueResultLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 5),
			valueResultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			simulateAgainButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
			simulateAgainButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			simulateAgainButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			simulateAgainButton.heightAnchor.constraint(equalToConstant: 45),
			
			otherCalculationButton.topAnchor.constraint(equalTo: simulateAgainButton.bottomAnchor, constant: 10),
			otherCalculationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			otherCalculationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			otherCalculationButton.heightAnchor.constraint(equalToConstant: 45)
	
		])
	}
}
