//
//  LandingPageCollectionViewCell.swift
//  brianApps
//
//  Created by DEVALDA on 21/05/23.
//

import UIKit

class LandingPageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var descBCell: UILabel!
    @IBOutlet weak var descACell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgCell.clipsToBounds = true
        self.descACell.clipsToBounds = true
        self.descBCell.clipsToBounds = true
        // Initialization code
    }

}
