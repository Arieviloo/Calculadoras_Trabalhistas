import UIKit

class ListReasonViewController: UIViewController {
	
	private var listReasonView = ListReasonView()
	let test = ["1", "2", "3", "4"]
	
	override func loadView() {
		view = listReasonView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
	}
	
	private func configView() {
		listReasonView.protocolsTableView(delegate: self, dataSource: self)
		listReasonView.delegate(delegate: self)
	}
}

extension ListReasonViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return test.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ListReasonTableViewCell.identifier, for: indexPath) as? ListReasonTableViewCell
		let backgroundCell = UIView()
		cell?.reasonLabel.text = test[indexPath.row]
		backgroundCell.backgroundColor = UIColor.appBlueLight
		cell?.selectedBackgroundView = backgroundCell
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		45
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(test[indexPath.row])
	}
	
}

extension ListReasonViewController: ListReasonViewProtocol {
	func tappedNext() {
		let nextVC =  NoticePeriodViewController()
		navigationController?.pushViewController(nextVC, animated: true)
	}
}
