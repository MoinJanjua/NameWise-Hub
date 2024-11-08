//
//  CountryListViewController.swift
//  NameSpectrum Hub
//
//  Created by Unique Consulting Firm on 28/09/2024.
//

import UIKit

class CountryListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {
    
    
    
    @IBOutlet weak var TableV: UITableView!
    @IBOutlet weak var TitleLbl: UILabel!

    @IBOutlet weak var MianView: UIView!
    var isFromTrending = false
    var isFromUnique = false
    var isFromHomeName = String()
    
    let titleList = [
        "Untied States",
        "Untied Kingdom",
        "Canada","Australia",
        "India","Germeny","France",
        "Japan","Brazil",
        "Italy","Pakistan"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableV.delegate = self
        TableV.dataSource = self
        // Do any additional setup after loading the view.
        applyCornerRadiusToBottomCorners(view: MianView, cornerRadius: 35)
        TitleLbl.text = isFromHomeName

    }
    
    @IBAction func BackBtn(_ sender: UIButton) {
               self.dismiss(animated: true)
           }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! countrylistTableViewCell
        
        let list = countries[indexPath.row]
        cell.Namelbl.text = list.countryName
        cell.flagImg.image = UIImage(named: list.flagImage)
        cell.aniamatedView.isHidden = false
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let list = countries[indexPath.row]
        
        if isFromTrending
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SelectGenderViewController") as! SelectGenderViewController
            newViewController.list = [list]
            newViewController.isFromName = titleList[indexPath.row]
            newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        else if isFromUnique
          {
              let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
              let newViewController = storyBoard.instantiateViewController(withIdentifier: "NameListViewController") as! NameListViewController
              newViewController.isFromUnique = true
              newViewController.list = [list]
              newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
              newViewController.modalTransitionStyle = .crossDissolve
              self.present(newViewController, animated: true, completion: nil)
          }
        else
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "NameListViewController") as! NameListViewController
                newViewController.list = [list]
                newViewController.isFromhistory = true
                newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}


// Name Model


// Country Model
struct Country {
    let countryName: String
    let flagImage: String
    let uniqueNames : [Name]
    let historicalNames: [Name]
    let boyNames: [Name]
    let girlNames: [Name]
}

struct Name {
    let name: String
    let meaning: String
}
