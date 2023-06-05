import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
    }
    

}
