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
		
		rescissionResultVM.resultRescission()
	}
	
}

