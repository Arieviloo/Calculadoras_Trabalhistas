import UIKit

class AdditionalViewController: UIViewController {
	private let additionalView = AdditionalView()
	
	override func loadView() {
		view = additionalView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
