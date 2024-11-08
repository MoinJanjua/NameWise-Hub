//
//  CategoryViewController.swift
//  NameSpectrum Hub
//
//  Created by UCF on 24/09/2024.
//

import UIKit
import FSPagerView

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout , FSPagerViewDelegate, FSPagerViewDataSource {
   
    

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var Titlelbl: UILabel!
    @IBOutlet weak var mView: UIView!
    
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    @IBOutlet weak var v7: UIView!
    @IBOutlet weak var v8: UIView!
    @IBOutlet weak var v9: UIView!
    @IBOutlet weak var v10: UIView!
    
    let titleList = [
        "Prophet Name",
        "Sahaba Name",
        "Historical Name",
        "Unique Name"
        
    ]
    var CollectionImgs = ["i4","I1","I2","i3"]
    
    let pagerImgs = ["q1","q2","q3","s1","q4","q5","q6","tmb","q7","q8","sw2","q9","q10","q11","q12"]
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(CustomPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyCornerRadiusToBottomCorners(view: mView, cornerRadius: 35)
        
        roundCorneView(view: v1)
        roundCorneView(view: v2)
        roundCorneView(view: v3)
        roundCorneView(view: v4)
        roundCorneView(view: v5)
        roundCorneView(view: v6)
        roundCorneView(view: v7)
        roundCorneView(view: v8)
        roundCorneView(view: v9)
//        roundCorneView(view: v10)

        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        // Do any additional setup after loading the view.
        
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.transformer = FSPagerViewTransformer(type: .invertedFerrisWheel)
        pagerView.itemSize = CGSize(width: 200, height: 200)
        pagerView.automaticSlidingInterval = 1.0 // Adjust the interval as needed
    }
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        
        return pagerImgs.count
    }
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index) as! CustomPagerViewCell
        
        cell.imageView?.image = UIImage(named: pagerImgs[index])
        
        return cell
    }
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        cell.namelb.text = titleList[indexPath.row]
        cell.Image?.image = UIImage(named: CollectionImgs[indexPath.item])
        cell.contentView.layer.cornerRadius = 14
        cell.contentView.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SearchNameViewController") as! SearchNameViewController
        newViewController.isFromHomeName = titleList[indexPath.row]
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let spacing: CGFloat = 10
        let availableWidth = collectionViewWidth - (spacing * 3)
        let width = availableWidth / 2
        return CGSize(width: width - 20, height: 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Adjust as needed
    }
}
