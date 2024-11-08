//
//  NameHistoryTableViewCell.swift
//  NameSpectrum Hub
//
//  Created by Maaz on 08/10/2024.
//

import UIKit
import Lottie

class NameHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MeaningLabel: UILabel!
    @IBOutlet weak var NameLable: UILabel!
    @IBOutlet weak var Speakertbtn: UIButton!
    
    var speakerButtonAction: (() -> Void)?
    
    private var animationView: LottieAnimationView!
    @IBOutlet weak var aniamatedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLottieAnimation()
        
        Speakertbtn.addTarget(self, action: #selector(speakerButtonTapped), for: .touchUpInside)
        
    }
    @objc func speakerButtonTapped() {
        speakerButtonAction?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupLottieAnimation() {
        
        // Create a new instance for the first animation
        animationView = LottieAnimationView(name: "VsLBjLkcVr") // Ensure "AnimationQ" is in your project
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFill
        // Set the frame of the animation view to match the bounds of the aniamatedView
        animationView.frame = aniamatedView.bounds
        animationView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        aniamatedView.addSubview(animationView)
        // Start the animation
        animationView.play()
    }
}
