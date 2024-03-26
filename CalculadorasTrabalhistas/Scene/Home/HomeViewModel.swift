import UIKit

class HomeViewModel {
	
	private let title = String(localizedKey: "titleHome")
	private let customTitle =  [ NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 24, weight: .bold)
	]
	private let colorBackground = UIColor.white
	
	private let calculators: [Calculator] = [
		Calculator(name: "Salário Líquido", icon: "icon-salariominimo", nameViewController: "NetSalaryViewController"),
		Calculator(name: "Férias", icon: "icon-ferias", nameViewController: "VacationViewController"),
		Calculator(name: "Rescisão", icon: "icon-rescisao", nameViewController: "RescissionViewController"),
		Calculator(name: "Décimo Terceiro", icon: "icon-decimoterceiro", nameViewController: "ThirteenthViewController"),
	]
	
	public var getListCalculator: [Calculator] { calculators }
	
	public func getTitle() -> String { title }
	
	public func getCustomTitle() -> [NSAttributedString.Key : NSObject] { customTitle }
	
	public func getColorBackground() -> UIColor { colorBackground }
	
	public func numberOfItens() -> Int { calculators.count }
	
	public func sizeCollectionView(view: UIView) -> CGSize {
		let widthFrame = CGFloat((view.frame.width / 2 ) - 10)
		return CGSize(width: widthFrame , height: 200)
	}
}
