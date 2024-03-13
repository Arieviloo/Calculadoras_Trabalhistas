import UIKit

protocol NoticePeriodViewProtocol: NSObject {
	func tappedNext()
}

class NoticePeriodView: UIView {
	
	private weak var delegate: NoticePeriodViewProtocol?
	
	public func delegate(delegate:NoticePeriodViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var HowWillItBeNoticePeriodLabel: UILabel = {
		$0.setCustomTitleNormal(title: "HowWillItBeNoticePeriod")
		return $0
	}(UILabel())
	
	lazy var noticePeriodTableView: UITableView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.register(NoticePeriodTableViewCell.self, forCellReuseIdentifier: NoticePeriodTableViewCell.identifier)
		return $0
	}(UITableView())
	
	lazy var nextButton: UIButton = {
		$0.setCustomButton(title: "next", colorBackground: UIColor.appBlue)
		$0.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor =  .white
		configAddView()
		configConstraints()
	}
	
	public func protocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
		noticePeriodTableView.delegate = delegate
		noticePeriodTableView.dataSource = dataSource
	}
	
	@objc func tappedNext() {
		self.delegate?.tappedNext()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		addSubview(HowWillItBeNoticePeriodLabel)
		addSubview(noticePeriodTableView)
		addSubview(nextButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			HowWillItBeNoticePeriodLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			HowWillItBeNoticePeriodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			HowWillItBeNoticePeriodLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			
			noticePeriodTableView.topAnchor.constraint(equalTo: HowWillItBeNoticePeriodLabel.bottomAnchor, constant: 10),
			noticePeriodTableView.leadingAnchor.constraint(equalTo: HowWillItBeNoticePeriodLabel.leadingAnchor),
			noticePeriodTableView.trailingAnchor.constraint(equalTo: HowWillItBeNoticePeriodLabel.trailingAnchor),
			noticePeriodTableView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
			
			nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
			nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 160),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
			
		])
		
	}
}
