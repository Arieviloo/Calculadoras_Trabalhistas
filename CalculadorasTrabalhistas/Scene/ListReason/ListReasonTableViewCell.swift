import UIKit

class ListReasonTableViewCell: UITableViewCell {
	
	static let identifier = "ListReasonTableViewCell"
	
	lazy var borderView: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.cornerRadius = 20
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.borderWidth = 1
		return $0
	}(UIView())
	
	lazy var reasonLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.textColor = .red
		return $0
	}(UILabel())
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		contentView.addSubview(borderView)
		borderView.addSubview(reasonLabel)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			borderView.heightAnchor.constraint(equalToConstant: 40),
			
			reasonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			reasonLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
			
			
		])
		
	}
	
}
