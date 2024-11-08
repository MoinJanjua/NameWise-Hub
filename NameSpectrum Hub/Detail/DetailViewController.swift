//
//  DetailViewController.swift
//  NameSpectrum Hub
//
//  Created by Maaz on 04/10/2024.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var historytext: UITextView!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var MeaningSpeakingButton: UIButton!
    @IBOutlet weak var HistorySpeakingButton: UIButton!
    
    var detailInformation = [String]()
    var name: String?
    var meaning: String?
    
    var speechSynthesizer: AVSpeechSynthesizer?
    var isSpeaking: Bool = false
    var textToSpeak: String?
    var onShareButtonTapped: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        meaningLabel.text = meaning
        
        applyCornerRadiusToBottomCorners(view: mView, cornerRadius: 35)
        speechSynthesizer = AVSpeechSynthesizer()
    }
    
    @objc func copyTextmeaningLabel() {
        if let text = meaningLabel.text {
            UIPasteboard.general.string = text
            self.showToast(message: "Copied Meaning", font: UIFont.systemFont(ofSize: 17.0))
        }
    }
    
//    @objc func copyTexthistoryLabel() {
//        if let text = meaningLabel.text {
//            UIPasteboard.general.string = text
//            self.showToast(message: "Quotes Copied", font: UIFont.systemFont(ofSize: 17.0))
//        }
//    }
    @IBAction func shareButton1(_ sender: Any) {
        if let textToShare = meaningLabel.text {
               let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
               
               // Present the activity view controller
               activityViewController.popoverPresentationController?.sourceView = self.view // For iPad support
               self.present(activityViewController, animated: true, completion: nil)
           }
    }
    @IBAction func copyButton(_ sender: Any) {
        copyTextmeaningLabel()
    }
    
    @IBAction func volumeButton(_ sender: Any) {
        if let text = meaningLabel.text {
            if isSpeaking {
                speechSynthesizer?.stopSpeaking(at: .immediate)
                isSpeaking = false
                MeaningSpeakingButton.setImage(UIImage(named: "volume"), for: .normal)
            } else {
                let utterance = AVSpeechUtterance(string: text)
                speechSynthesizer?.speak(utterance)
                isSpeaking = true
                MeaningSpeakingButton.setImage(UIImage(named: "volume_off"), for: .normal)
            }
        }
    }
    
//    @IBAction func copyButton2(_ sender: Any) {
//        copyTexthistoryLabel()
//    }
    
    @IBAction func BackBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
