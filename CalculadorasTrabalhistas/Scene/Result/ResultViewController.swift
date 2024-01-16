import UIKit

class ResultViewController: UIViewController {
	private let resultView = ResultView()
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
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
}
