import UIKit

class NoticePeriodViewController: UIViewController {
	
	private var noticePeriodView = NoticePeriodView()
	private var noticePeriodVM = NoticePeriodViewModel()
	let test = ["1", "2", "3", "4"]
	
	init(calculator: Calculator) {
		super.init(nibName: nil, bundle: nil)
		noticePeriodVM.setCalculator(calculator: calculator)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = noticePeriodView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
	}
	
	private func configView() {
		title = noticePeriodVM.getTitle()
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
		noticePeriodVM.setNoticePeriod(noticePeriod: test[indexPath.row])
	}
	
}

extension NoticePeriodViewController: NoticePeriodViewProtocol {
	func tappedNext() {
		guard let calculator = noticePeriodVM.calculator else { return }
		let nextVC = VacationAccumulatedViewController()
		navigationController?.pushViewController(nextVC, animated: true)
	}
}
