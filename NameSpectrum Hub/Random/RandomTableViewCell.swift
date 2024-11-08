//
//  RandomTableViewCell.swift
//  NameSpectrum Hub
//
//  Created by Maaz on 08/10/2024.
//

import UIKit

class RandomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MeaningLabel: UILabel!
    @IBOutlet weak var NameLable: UILabel!
    @IBOutlet weak var Speakertbtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    contentView.showToast(message: "Quotes Copied", font: .systemFont(ofSize: 17.0))
    @objc func copyTextNameLabel() {
        if let text = NameLable.text {
            UIPasteboard.general.string = text
            contentView.showToast(message: "Name Copied", font: UIFont.systemFont(ofSize: 17.0))
        }
    }
    @objc func copyTextmeaningLabel() {
        if let text = MeaningLabel.text {
            UIPasteboard.general.string = text
            contentView.showToast(message: "Meaning Copied", font: UIFont.systemFont(ofSize: 17.0))
        }
    }
    @IBAction func Copy1(_ sender: Any) {
        copyTextNameLabel()
    }
    
    @IBAction func Copy2(_ sender: Any) {
        copyTextmeaningLabel()
    }
}
