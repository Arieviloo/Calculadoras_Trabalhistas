import UIKit

class ListReasonViewController: UIViewController {
	
	private var listReasonView = ListReasonView()
	private var listReasonVM = ListReasonViewModel()
	let test = ["1", "2", "3", "4"]
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		listReasonVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = listReasonView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
	}
	
	private func configView() {
		title = listReasonVM.getTitle()
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
		listReasonVM.setReasonResignation(reason: test[indexPath.row])
		
	}
	
}

extension ListReasonViewController: ListReasonViewProtocol {
	func tappedNext() {
		guard let calculator = listReasonVM.calculator else { return }
		let nextVC =  NoticePeriodViewController(calculator: calculator)
		navigationController?.pushViewController(nextVC, animated: true)
	}
}
