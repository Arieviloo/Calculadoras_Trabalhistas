import UIKit

class RescissionResultViewController: UIViewController {
	
	private let rescissionResultView = RescissionResultView()
	private let rescissionResultVM = RescissionResultViewModel()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		rescissionResultVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = rescissionResultView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	private func configView() {
		title = String(localizedKey: "result")
		calculateRescission()
		rescissionResultView.delegate(delegate: self)
	}
	
	private func calculateRescission() {
		let result = rescissionResultVM.resultRescission()
		let noticePeriod = result.noticePeriod ?? 0
		let colorNoticePeriod = result.noticePeriodColor ?? ""
		rescissionResultView.setValueRescission( formatCurrency(value: result.verbsRescission ?? 0),
												 formatCurrency(value: result.discountsRescission ?? 0),
												 formatCurrency(value: result.totalFGTSRescission ?? 0),
												 formatCurrency(value: result.totalRescission ?? 0))
		if noticePeriod != 0 {
			rescissionResultView.setValueNoticePeriod(formatCurrency(value: noticePeriod), colorNoticePeriod )
		}
	}
	
}

extension RescissionResultViewController: RescissionResultViewProtocol {
	func tappedSimulateAgainButton() {
		if let destinationViewController = navigationController?.viewControllers
			.filter({$0 is SalaryViewController})
			.first {navigationController?.popToViewController(destinationViewController, animated: true)
		}
	}
	
	func tappedOtherCalculationButton() {
		navigationController?.popToRootViewController(animated: true)
	}
	
	
}

