import UIKit

class ResultViewController: UIViewController {
	private let resultView = ResultView()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		calculateNetSalary(calculator: calculator)
		dump(calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = resultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = String(localizedKey: "result")
	}
	
	private func calculateNetSalary(calculator: Calculator) {
		
		resultView.valueGrossSalaryLabel.text = formatCurrency(value: calculator.valueSalaryGross ?? 0)
		resultView.valueAdditionalDangueroussLabel.text = formatCurrency(value: calculator.valueAditionalDangerousness ?? 0)
		resultView.valueAdditionalInsalubrityLabel.text = formatCurrency(value: calculator.valueLevelInsalubrity ?? 0)
		resultView.valueOtherAdditionalLabel.text = formatCurrency(value: calculator.valueOtherAdditional ?? 0)
	}
	
}
