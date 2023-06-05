import UIKit

struct VideoModel {
    let caption: String
    let username: String
    let audioTrackName: String
    let videoFileName: String
    let videoFileFormat:  String
}

class ViewController: UIViewController, UICollectionViewDataSource{

    
    
    private var collectionView: UICollectionView?
    
    private var data = [VideoModel]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<5 {
            let model = VideoModel(caption: "This is a cat",
                                   username: "@afraz",
                                   audioTrackName: "iOS Academy Video Song",
                                   videoFileName: "2",
                                   videoFileFormat: "mp4")
            
            let modelplus = VideoModel(caption: "This is a cat just chill",
                                   username: "@catflex",
                                   audioTrackName: "iOS Academy Video Song",
                                   videoFileName: "cat",
                                   videoFileFormat: "mp4")
            
            data.append(model)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
        cell.configure(with: model)
        return cell
    }

}
