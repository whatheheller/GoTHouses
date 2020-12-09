

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSound(name: "GoT_theme")
        
        let yStart = imgView.frame.origin.y
        imgView.frame.origin.y = self.view.frame.height
        UIView.animateKeyframes(withDuration: 1.0, delay: 1.0, animations: {self.imgView.frame.origin.y = yStart})
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription). Could not read data from file")
            }
        } else {
            print("ERROR: Could not read data from file \(name)")
        }
        
    }
    
    @IBAction func imgTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
}
