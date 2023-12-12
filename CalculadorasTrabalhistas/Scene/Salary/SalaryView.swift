import UIKit

class SalaryView: UIView {
	
	lazy var salaryLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = String(localizedKey: "whichValueSalary")
		$0.font = UIFont(name: "Montserrat-light", size: 16)
		return $0
	}(UILabel())
	
	lazy var salaryValueTextField: UITextField = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
		$0.leftViewMode = .always
		$0.font = UIFont.systemFont(ofSize: 18)
		$0.backgroundColor = UIColor.appGray
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 10
		$0.autocorrectionType = .no
		$0.keyboardType = .numbersAndPunctuation
		return $0
	}(UITextField())
	
	lazy var subTitleSalaryLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = String(localizedKey: "subTitleValueSalary")
		$0.numberOfLines = 0
		$0.font = UIFont(name: "Montserrat-Medium", size: 10)
		return $0
	}(UILabel())
	
	lazy var dependentLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = String(localizedKey: "howMuchDependents")
		$0.font = UIFont(name: "Montserrat-light", size: 16)
		return $0
	}(UILabel())
	
	lazy var subTitleDependentLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = String(localizedKey: "subTitleValueDependents")
		$0.numberOfLines = 0
		$0.font = UIFont(name: "Montserrat-Medium", size: 10)
		return $0
	}(UILabel())
	
	lazy var dependentValueTextField: UITextField = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 40))
		$0.leftViewMode = .always
		$0.font = UIFont.systemFont(ofSize: 18)
		$0.backgroundColor = UIColor.appGray
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 10
		$0.autocorrectionType = .no
		$0.keyboardType = .numbersAndPunctuation
		return $0
	}(UITextField())
	
	lazy var nextButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setTitle(String(localizedKey: "next").uppercased(), for: .normal)
		$0.titleLabel?.font = UIFont(name: "Montserrat-ExtraBold", size: 18)
		$0.backgroundColor = UIColor.appBlue
		$0.tintColor = .white
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 10
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
		salaryValueTextField.delegate = delegate
		dependentValueTextField.delegate = delegate
	}
	
	private func configAddView() {
		addSubview(salaryLabel)
		addSubview(salaryValueTextField)
		addSubview(subTitleSalaryLabel)
		addSubview(dependentLabel)
		addSubview(subTitleDependentLabel)
		addSubview(dependentValueTextField)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			salaryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			salaryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
			salaryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
			
			salaryValueTextField.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 10),
			salaryValueTextField.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			salaryValueTextField.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			salaryValueTextField.heightAnchor.constraint(equalToConstant: 40),
			
			subTitleSalaryLabel.topAnchor.constraint(equalTo: salaryValueTextField.bottomAnchor, constant: 10),
			subTitleSalaryLabel.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			subTitleSalaryLabel.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			
			dependentLabel.topAnchor.constraint(equalTo: subTitleSalaryLabel.bottomAnchor, constant: 40),
			dependentLabel.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			dependentLabel.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			
			subTitleDependentLabel.topAnchor.constraint(equalTo: dependentLabel.bottomAnchor, constant: 10),
			subTitleDependentLabel.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			subTitleDependentLabel.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			
			dependentValueTextField.topAnchor.constraint(equalTo: subTitleDependentLabel.bottomAnchor, constant: 10),
			dependentValueTextField.leadingAnchor.constraint(equalTo: salaryLabel.leadingAnchor),
			dependentValueTextField.trailingAnchor.constraint(equalTo: salaryLabel.trailingAnchor),
			dependentValueTextField.heightAnchor.constraint(equalToConstant: 40),
			
			nextButton.topAnchor.constraint(equalTo: dependentValueTextField.bottomAnchor, constant: 50),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
			
		])
	}
}
