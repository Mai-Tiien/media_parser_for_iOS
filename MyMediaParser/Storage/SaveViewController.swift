import UIKit

class SaveViewController: UIViewController, UITableViewDataSource{
    
    let searchController = UISearchController()

    @IBOutlet weak var tableSecond: UITableView!
    
    struct Imageset {
        let titletxt: String
        let imageMedia: String
    }
    
    let dataMedia: [Imageset] = [
        Imageset(titletxt: "Пенсійний фонд нагадав, як авторизуватися у мобільному застосунку", imageMedia: "cat1"),
        Imageset(titletxt: "Вашингтоні презентували українську «Дію»",  imageMedia: "cat2"),
        Imageset(titletxt: "E-система для відбудови України DREAM ",  imageMedia: "cat3"),
        Imageset( titletxt: "Маск знайшов генерального директора для Твіттера",  imageMedia: "cat4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSecond.dataSource = self
        navigationItem.searchController = searchController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMedia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageset = dataMedia[indexPath.row]
               let cell2 = tableSecond.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SaveCustomTableViewCell
               cell2.texttitle.text = imageset.titletxt
               cell2.photo.image = UIImage(named: imageset.imageMedia)
               return cell2
    }

}
