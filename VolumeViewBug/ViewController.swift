import AVKit
import MediaPlayer
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var volumeContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create MPVolumeView in the volume container
        debugPrint("Creating AVPlayerViewController")
        let volumeView = MPVolumeView(frame: volumeContainer.bounds)
        volumeContainer.addSubview(volumeView)
        volumeContainer.backgroundColor = .clear
    }

    @IBAction func showAVPlayerViewController(_ sender: Any) {
        debugPrint("Creating AVPlayerViewController")

        let playerViewController = AVPlayerViewController()
        playerViewController.player = AVPlayer(url: URL(fileURLWithPath: "test.mov"))

        debugPrint("Presenting AVPlayerViewController")
        present(playerViewController, animated: false)

        // Dismiss the player view controller after two seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            debugPrint("Dismissing AVPlayerViewController")
            playerViewController.player = nil
            self.dismiss(animated: false)
        }
    }
}
