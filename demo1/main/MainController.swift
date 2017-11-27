import UIKit

class MainController: UIViewController, UISearchBarDelegate, MainView {
    let SPACING = CGFloat(3)
    private var presenter: MainPresenter?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var grid: UICollectionView!
    private var delegate: GridDelegate? = nil
    private var layout: UICollectionViewDelegateFlowLayout? = nil

    func setResults(_ results: [Results]) {
        (grid?.dataSource as? GridDelegate)?.results = results
        grid.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        grid.collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter!.view = self
        searchBar?.delegate = self as? UISearchBarDelegate
        delegate = GridDelegate()
        grid?.dataSource = delegate
        layout = Layout()
        grid?.delegate = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchBarSearchButtonClicked(searchText)
    }

}

