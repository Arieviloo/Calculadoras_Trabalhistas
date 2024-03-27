import UIKit

protocol ThirteenthViewProtocol: NSObject {
	func tappedCalculate()
}

class ThirteenthView: UIView {
	
	private weak var delegate: ThirteenthViewProtocol?
	public func delegate(delegate: ThirteenthViewProtocol) {
		self.delegate = delegate
	}
		
	lazy var monthWorkedLabel: UILabel = {
		$0.setCustomTitleNormal(title: "monthWorked")
		return $0
	}(UILabel())
	
	lazy var monthWorkedTextField: UITextField = {
		$0.setCustomTextField()
		$0.text = "12"
		return $0
	}(UITextField())
	
	lazy var typePaymentLabel: UILabel = {
		$0.setCustomTitleNormal(title: "typePayment")
		return $0
	}(UILabel())
	
	lazy var typePaymentTableView: UITableView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.register(ListTypePaymentTableViewCell.self, forCellReuseIdentifier: ListTypePaymentTableViewCell.identifier)
		return $0
	}(UITableView())
	
	lazy var calculateButton: UIButton = {
		$0.setCustomButton(title: "calculate", colorBackground: UIColor.appBlueHeavy)
		$0.addTarget(self, action: #selector(tappedCalculate), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func protocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
		typePaymentTableView.delegate = delegate
		typePaymentTableView.dataSource = dataSource
	}
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
		monthWorkedTextField.delegate = delegate
	}
	
	@objc func tappedCalculate() {
		self.delegate?.tappedCalculate()
	}
	
	private func configAddView() {
		addSubview(monthWorkedLabel)
		addSubview(monthWorkedTextField)
		addSubview(typePaymentLabel)
		addSubview(typePaymentTableView)
		addSubview(calculateButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			monthWorkedLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			monthWorkedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			monthWorkedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			monthWorkedTextField.topAnchor.constraint(equalTo: monthWorkedLabel.bottomAnchor, constant: 10),
			monthWorkedTextField.leadingAnchor.constraint(equalTo: monthWorkedLabel.leadingAnchor),
			monthWorkedTextField.trailingAnchor.constraint(equalTo: monthWorkedLabel.trailingAnchor),
			monthWorkedTextField.heightAnchor.constraint(equalToConstant: 40),
			
			typePaymentLabel.topAnchor.constraint(equalTo: monthWorkedTextField.bottomAnchor, constant: 10),
			typePaymentLabel.leadingAnchor.constraint(equalTo: monthWorkedLabel.leadingAnchor),
			typePaymentLabel.trailingAnchor.constraint(equalTo: monthWorkedLabel.trailingAnchor),
			
			typePaymentTableView.topAnchor.constraint(equalTo: typePaymentLabel.bottomAnchor, constant: 10),
			typePaymentTableView.leadingAnchor.constraint(equalTo: monthWorkedLabel.leadingAnchor),
			typePaymentTableView.trailingAnchor.constraint(equalTo: monthWorkedLabel.trailingAnchor),
			typePaymentTableView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -10),
			
			calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			calculateButton.widthAnchor.constraint(equalToConstant: 160),
			calculateButton.heightAnchor.constraint(equalToConstant: 45),
		])
	}
}
