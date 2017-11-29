import UIKit

class MainController: UIViewController, MainView {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var gridContanierView: UIView!
    @IBOutlet weak var brianContainerView: UIView!
    private var presenter: MainPresenter? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        searchBar?.delegate = presenter
        presenter?.view = self
    }

    func setResults(_ results: [Result]) {
        (childViewControllers[0] as! GridViewController).setResults(results)
    }

    func hideBrian() {
        brianContainerView.removeFromSuperview()
    }
}


