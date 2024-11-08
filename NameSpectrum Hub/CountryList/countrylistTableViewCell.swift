//
//  countrylistTableViewCell.swift
//  NameSpectrum Hub
//
//  Created by Unique Consulting Firm on 28/09/2024.
//

import UIKit
import Lottie

class countrylistTableViewCell: UITableViewCell {

    @IBOutlet weak var Namelbl: UILabel!
    @IBOutlet weak var flagImg: UIImageView!
    @IBOutlet weak var roundview: UIView!
    
    private var animationView: LottieAnimationView!
    @IBOutlet weak var aniamatedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLottieAnimation()
        
    }
     func setupLottieAnimation() {
         
         // Create a new instance for the first animation
         animationView = LottieAnimationView(name: "XkK1jzQdNl") // Ensure "AnimationQ" is in your project
         animationView.loopMode = .loop
         animationView.contentMode = .scaleAspectFill
         // Set the frame of the animation view to match the bounds of the aniamatedView
         animationView.frame = aniamatedView.bounds
         animationView.frame = CGRect(x: 0, y: 0, width: 35, height: 30)
         aniamatedView.addSubview(animationView)
         // Start the animation
         animationView.play()
     }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
