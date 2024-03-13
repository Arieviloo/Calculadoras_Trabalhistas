import UIKit

class NoticePeriodViewController: UIViewController {
	
	private var noticePeriodView = NoticePeriodView()
	let test = ["1", "2", "3", "4"]
	
	override func loadView() {
		view = noticePeriodView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
	}
	
	private func configView() {
		noticePeriodView.protocolsTableView(delegate: self, dataSource: self)
		noticePeriodView.delegate(delegate: self)
	}
}

extension NoticePeriodViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return test.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: NoticePeriodTableViewCell.identifier, for: indexPath) as? NoticePeriodTableViewCell
		let backgroundCell = UIView()
		cell?.noticeLabel.text = test[indexPath.row]
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

extension NoticePeriodViewController: NoticePeriodViewProtocol {
	func tappedNext() {
		let nextVC = VacationAccumulatedViewController()
		navigationController?.pushViewController(nextVC, animated: true)
	}
}
