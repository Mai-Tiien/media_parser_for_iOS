import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    var player: AVPlayer?
    static let identifier = "VideoCollectionViewCell"
    private var model: VideoModel?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
    }
    
    public func configure(with model: VideoModel){
        self.model = model
        configureVideo()
    }
    
    private func configureVideo() {
        
        guard let model = model else {
            return
        }
        
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
            print("Failed to find video!")
            return
        }
        
        let newPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerView = AVPlayerLayer()
        playerView.player = newPlayer
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        contentView.layer.addSublayer(playerView)
        
        player = newPlayer
        player?.volume = 1
        player?.play()
    
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        player?.volume = 0
        player?.pause()
        player = nil
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
