//
//  ReligiousViewController.swift
//  NameSpectrum Hub
//
//  Created by Maaz on 03/10/2024.
//

import UIKit

class ReligiousViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var TableV: UITableView!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    @IBOutlet weak var v7: UIView!
    @IBOutlet weak var v8: UIView!
    @IBOutlet weak var TitleLbl: UILabel!
 
    
    let NameList = ["Muslim Name", "Christian Name", "Hindu Name", "African Name", "Persian Name", "Greek Name", "Chinese Name", "Japanese Name","Korean Name","Roman Name", "Armenian Name", "Sikh Name", "Filipino Name", "Jewish Name"]
    let ImgName = ["religious", "christian", "hindu", "african", "persian", "greek", "chinese", "japanese", "korea","roman", "american", "sikh", "filipino", "jewish"]
    var isFromHomeName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        roundCorneView(view: v1)
        roundCorneView(view: v2)
        roundCorneView(view: v3)
        roundCorneView(view: v4)
        roundCorneView(view: v5)
        roundCorneView(view: v6)
        roundCorneView(view: v7)
        roundCorneView(view: v8)
        
        TableV.delegate = self
        TableV.dataSource = self
        
        TitleLbl.text = isFromHomeName
    }
 
    
    @IBAction func BackBtn(_ sender: UIButton) {
            self.dismiss(animated: true)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        let Name = NameList[indexPath.row]
        cell.Namelbl.text = Name
        cell.RegiliousImg.image? = UIImage(named: ImgName[indexPath.row])!
        cell.aniamatedView.isHidden = false
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SelectGenderViewController")
        as! SelectGenderViewController
        //secondVC.imageName = "animal_image"
        secondVC.isFromName = NameList[indexPath.row]
        secondVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        self.present(secondVC, animated: true)
       
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
