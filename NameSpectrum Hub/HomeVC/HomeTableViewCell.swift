//
//  HomeTableViewCell.swift
//  NameSpectrum Hub
//
//  Created by UCF on 24/09/2024.
//

import UIKit
import Lottie

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Namelbl: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var roundview: UIView!
    @IBOutlet weak var RegiliousImg: UIImageView!
    
    private var animationView: LottieAnimationView!
    @IBOutlet weak var aniamatedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundCorneView(view:roundview)
        
        //     viewShadow(view: curveView)
        
        // Set up shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
        
        // Set background opacity
        contentView.alpha = 1.5 // Adjust opacity as needed
        
        setupLottieAnimation()
        
    }
     func setupLottieAnimation() {
         
         // Create a new instance for the first animation
         animationView = LottieAnimationView(name: "arrawsame") // Ensure "AnimationQ" is in your project
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
