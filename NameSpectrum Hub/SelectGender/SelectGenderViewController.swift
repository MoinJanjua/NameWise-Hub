//
//  SelectGenderViewController.swift
//  NameSpectrum Hub
//
//  Created by UCF on 24/09/2024.
//

import UIKit
import FLAnimatedImage

class SelectGenderViewController: UIViewController {

    @IBOutlet weak var Boybtn: UIButton!
    @IBOutlet weak var Girlbtn: UIButton!
    
   
    @IBOutlet weak var IV2: FLAnimatedImageView! // Change from UIImageView to FLAnimatedImageView
       @IBOutlet weak var IV1: FLAnimatedImageView!
    
    @IBOutlet weak var GenderView: UIView!
    
    var isFromName = String()
    var list = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        roundCorner(button:Boybtn)
        roundCorner(button:Girlbtn)
        // Do any additional setup after loading the view.
        applyCornerRadiusToBottomCorners(view: GenderView, cornerRadius: 35)

              if let gifUrl1 = Bundle.main.url(forResource: "man-", withExtension: "gif") {
                  let gifData1 = try! Data(contentsOf: gifUrl1)
                  let gifImage1 = FLAnimatedImage(animatedGIFData: gifData1)
                  IV1.animatedImage = gifImage1
              }
              
              // Load the GIF for IV2 (girl GIF)
              if let gifUrl2 = Bundle.main.url(forResource: "girl-", withExtension: "gif") {
                  let gifData2 = try! Data(contentsOf: gifUrl2)
                  let gifImage2 = FLAnimatedImage(animatedGIFData: gifData2)
                  IV2.animatedImage = gifImage2
              }
        

    }
    @IBAction func Boybtn(_ sender: UIButton) {
       
        if isFromName == "Muslim Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        
        if isFromName == "Christian Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = christianBoyNames
            newViewController.isFromHomeName = "Christian Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Hindu Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = christianBoyNames
            newViewController.isFromHomeName = "Hindu Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "African Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = africanBoyNames
            newViewController.isFromHomeName = "African Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Persian Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = persianBoyNames
            newViewController.isFromHomeName = "Persian Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Greek Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = greekBoyNames
            newViewController.isFromHomeName = "Greek Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Chinese Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = chineseBoyNames
            newViewController.isFromHomeName = "Chinese Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Japanese Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = japaneseBoyNames
            newViewController.isFromHomeName = "Japanese Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Korean Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = koreanBoyNames
            newViewController.isFromHomeName = "Korean Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Roman Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = romanBoyNames
            newViewController.isFromHomeName = "Roman Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Armenian Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = armenianBoyNames
            newViewController.isFromHomeName = "Armenian Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Sikh Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = sikhBoyNames
            newViewController.isFromHomeName = "Sikh Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Filipino Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = filipinoBoyNames
            newViewController.isFromHomeName = "Filipino Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Jewish Name"
        {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = jewishBoyNames
            newViewController.isFromHomeName = "Jewish Boy"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        else
        {
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "NameListViewController") as! NameListViewController
//            newViewController.list = list
//            newViewController.isFromBoy = true
//            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//            newViewController.modalTransitionStyle = .crossDissolve
//            self.present(newViewController, animated: true, completion: nil)
        }
    }
    @IBAction func Girlbtn(_ sender: UIButton){
    
        if isFromName == "Muslim Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = muslimGirlNames
            newViewController.isFromHomeName = "Muslim Girl"
            //newViewController.isCountryName = "Girl"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Christian Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = christianGirlNames
            newViewController.isFromHomeName = "Christian Girl"
            newViewController.isCountryName = "Christian"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Hindu Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = hinduGirlNames
            newViewController.isFromHomeName = "Hindu Girl"
            newViewController.isCountryName = "Hindu"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "African Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = africanGirlNames
            newViewController.isFromHomeName = "African Girl"
            newViewController.isCountryName = "African"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Persian Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = persianGirlNames
            newViewController.isFromHomeName = "Persian Girl"
            newViewController.isCountryName = "Persian"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Greek Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = greekGirlNames
            newViewController.isFromHomeName = "Greek Girl"
            newViewController.isCountryName = "Greek"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Chinese Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = chineseGirlNames
            newViewController.isFromHomeName = "Chinese Girl"
            newViewController.isCountryName = "Chinese"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Japanese Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = japaneseGirlNames
            newViewController.isFromHomeName = "Japanese Girl"
            newViewController.isCountryName = "Japanese"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Korean Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = koreanGirlNames
            newViewController.isFromHomeName = "Korean Girl"
            newViewController.isCountryName = "Korean"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Roman Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = romanGirlNames
            newViewController.isFromHomeName = "Roman Girl"
            newViewController.isCountryName = "Roman"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Armenian Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = armenianGirlNames
            newViewController.isFromHomeName = "Armenian Girl"
            newViewController.isCountryName = "Armenian"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Sikh Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = sikhGirlNames
            newViewController.isFromHomeName = "Sikh Girl"
            newViewController.isCountryName = "Sikh"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Filipino Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = filipinoGirlNames
            newViewController.isFromHomeName = "Filipino Girl"
            newViewController.isCountryName = "Filipino"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        if isFromName == "Jewish Name"
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
            newViewController.names = jewishGirlNames
            newViewController.isFromHomeName = "Jewish Girl"
            newViewController.isCountryName = "Jewish"
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        
        else
        {
//                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                   let newViewController = storyBoard.instantiateViewController(withIdentifier: "NameListViewController") as! NameListViewController
//                   newViewController.list = list
//                   newViewController.isFromBoy = false
//                   newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//                   newViewController.modalTransitionStyle = .crossDissolve
//                   self.present(newViewController, animated: true, completion: nil)
               }
    }
    
    
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
