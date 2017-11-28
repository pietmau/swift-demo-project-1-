import UIKit

class MainController: UIViewController, FooView {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var gridContanierView: UIView!
    @IBOutlet weak var brianContainerView: UIView!
    private var presenter: FooPresenter? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FooPresenter()
        searchBar?.delegate = presenter
        presenter?.view = self
        let ff = childViewControllers
        print("")
    }

    func setResults(_ results: [Results]) {
        (childViewControllers[0] as! GridViewController).setResults(results)
    }

    func hideBrian() {
        brianContainerView.removeFromSuperview()
    }
}


