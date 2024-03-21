import UIKit

class RescissionResultView: UIView {
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = "Rescisão"
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
	
	lazy var resultCalculationLabel: UILabel = {
		$0.setTextStrong(title: "resultCaculation", color:  UIColor.appGreen)
		return $0
	}(UILabel())
	
	lazy var verbsRescissionLabel: UILabel = {
		$0.setTextSmall(title: "verbsRescission")
		return $0
	}(UILabel())
	
	lazy var valueVerbsRescissionLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var discountsLabel: UILabel = {
		$0.setTextSmall(title: "discounts")
		return $0
	}(UILabel())
	
	lazy var valueDiscountsLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var totalFGTSLabel: UILabel = {
		$0.setTextSmall(title: "totalFGTS")
		return $0
	}(UILabel())
	
	lazy var valueTotalFGTSLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-light", size: 12)
		$0.text = "R$ 0.00"
		return $0
	}(UILabel())
	
	lazy var resultLabel: UILabel = {
		$0.setTextStrong(title: "O valor da rescisão será de", color: UIColor.appBlue)
		return $0
	}(UILabel())
	
	lazy var valueResultLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Montserrat-ExtraBold", size: 20)
		$0.textColor = UIColor.appBlue
		$0.text = "R$ 0,00"
		return $0
	}(UILabel())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setValueRescission(_ verbsRescision: String, _ discount: String, _ fgts: String, _ total: String) {
		valueVerbsRescissionLabel.text = verbsRescision
		valueDiscountsLabel.text = discount
		valueTotalFGTSLabel.text = fgts
		valueResultLabel.text = total
	}
	
	private func configAddView() {
		addSubview(titleLabel)
		addSubview(contentView)
		contentView.addSubview(resultCalculationLabel)
		contentView.addSubview(verbsRescissionLabel)
		contentView.addSubview(valueVerbsRescissionLabel)
		contentView.addSubview(discountsLabel)
		contentView.addSubview(valueDiscountsLabel)
		contentView.addSubview(totalFGTSLabel)
		contentView.addSubview(valueTotalFGTSLabel)
		contentView.addSubview(resultLabel)
		contentView.addSubview(valueResultLabel)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
			
			contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 300),
			
			resultCalculationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			resultCalculationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			resultCalculationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			verbsRescissionLabel.topAnchor.constraint(equalTo: resultCalculationLabel.bottomAnchor, constant: 10),
			verbsRescissionLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
		
			valueVerbsRescissionLabel.centerYAnchor.constraint(equalTo: verbsRescissionLabel.centerYAnchor),
			valueVerbsRescissionLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			discountsLabel.topAnchor.constraint(equalTo: verbsRescissionLabel.bottomAnchor, constant: 10),
			discountsLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
		
			valueDiscountsLabel.centerYAnchor.constraint(equalTo: discountsLabel.centerYAnchor),
			valueDiscountsLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			totalFGTSLabel.topAnchor.constraint(equalTo: discountsLabel.bottomAnchor, constant: 10),
			totalFGTSLabel.leadingAnchor.constraint(equalTo: resultCalculationLabel.leadingAnchor),
		
			valueTotalFGTSLabel.centerYAnchor.constraint(equalTo: totalFGTSLabel.centerYAnchor),
			valueTotalFGTSLabel.trailingAnchor.constraint(equalTo: resultCalculationLabel.trailingAnchor),
			
			resultLabel.bottomAnchor.constraint(equalTo: valueResultLabel.topAnchor, constant: -10),
			resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			valueResultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			valueResultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			
			
		])
	}
}
