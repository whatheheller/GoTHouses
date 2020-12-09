

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var armsDescrip: UILabel!
    @IBOutlet weak var armsLabel: UITextView!
    
    var houseInfo: HouseInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if houseInfo == nil {
            houseInfo = HouseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        updateUserInterface()
    }

    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        wordsLabel.text = houseInfo.words
        
        if wordsLabel.text == "" {
            wordsLabel.isHidden = true
        } else {
            wordsLabel.text = "\"\(houseInfo.words)\""
        }

        regionLabel.text = houseInfo.region
        armsLabel.text = houseInfo.coatOfArms
        imgView.image = UIImage(named: houseInfo.region)
        
        if armsLabel.text == "" {
            armsDescrip.isHidden = true
        }
    }
    
}
