import UIKit
import Lottie

class SearchNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MeaningLabel: UILabel!
    @IBOutlet weak var NameLable: UILabel!
    @IBOutlet weak var Speakertbtn: UIButton!

    // Closure to handle the speaker button tap
    var speakerButtonAction: (() -> Void)?
    
    private var animationView: LottieAnimationView!
    @IBOutlet weak var aniamatedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Speakertbtn.addTarget(self, action: #selector(speakerButtonTapped), for: .touchUpInside)
//        setupLottieAnimation()
    }

    @objc func speakerButtonTapped() {
        speakerButtonAction?()
    }
    
//    func setupLottieAnimation() {
//        
//        // Create a new instance for the first animation
//        animationView = LottieAnimationView(name: "VsLBjLkcVr") // Ensure "AnimationQ" is in your project
//        animationView.loopMode = .loop
//        animationView.contentMode = .scaleAspectFill
//        // Set the frame of the animation view to match the bounds of the aniamatedView
//        animationView.frame = aniamatedView.bounds
//        animationView.frame = CGRect(x: 0, y: 0, width: 35, height: 30)
//        aniamatedView.addSubview(animationView)
//        // Start the animation
//        animationView.play()
//    }
}
