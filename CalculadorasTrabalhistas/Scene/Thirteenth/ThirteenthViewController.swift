import UIKit

class ThirteenthViewController: UIViewController {
	
	private let thirteenthView = ThirteenthView()
	private let thirteenVM = ThirteenthViewModel()
	private let listTypePayment = ["Parcela única", "Primeira parcela", "Segunda parcela"]
	
	override func loadView() {
		view = thirteenthView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		hideKeyboardWhenTappedAround()
		thirteenthView.protocolsTableView(delegate: self, dataSource: self)
		thirteenthView.configTextFieldDelegate(delegate: self)

	}
}

extension ThirteenthViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		listTypePayment.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ListTypePaymentTableViewCell.identifier, for: indexPath) as? ListTypePaymentTableViewCell
		cell?.typePaymentLabel.text = listTypePayment[indexPath.row]
		let backgroundCell = UIView()
		backgroundCell.backgroundColor = UIColor.appBlueLight
		cell?.selectedBackgroundView = backgroundCell
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		45
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(listTypePayment[indexPath.row])
		
	}
}

extension ThirteenthViewController: UITextFieldDelegate {
	
}
