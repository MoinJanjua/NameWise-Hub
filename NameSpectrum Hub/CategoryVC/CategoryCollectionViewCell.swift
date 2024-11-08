//
//  CategoryCollectionViewCell.swift
//  NameSpectrum Hub
//
//  Created by UCF on 24/09/2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var namelb: UILabel!
    @IBOutlet weak var Image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
        //     viewShadow(view: curveView)
        contentView.layer.cornerRadius = 14
        // Set up shadow properties
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 4.0
        contentView.layer.masksToBounds = false
        
        // Set background opacity
        contentView.alpha = 1.5 // Adjust opacity as needed
        
        
    }
}
