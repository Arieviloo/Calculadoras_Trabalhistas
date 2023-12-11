import UIKit

class HomeView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
		backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
	
		])
	}
	
}
