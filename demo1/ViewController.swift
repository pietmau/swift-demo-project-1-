import UIKit

class ViewController: UIViewController, UISearchBarDelegate, MainView {
    private var presenter: MainPresenter?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var grid: UICollectionView!
    private var delegate: GridDelegate? = nil

    func setResults(_ results: [Results]) {
        (grid?.dataSource as? GridDelegate)?.results = results
        grid.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter!.view = self
        searchBar?.delegate = self as? UISearchBarDelegate
        delegate = GridDelegate()
        grid?.dataSource = delegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchBarSearchButtonClicked(searchBar.text)
    }

}

