//
//  CustomCollectionViewCell.swift
//  VaingloryGuide
//
//  Created by Geraldine Forto on 19/07/2016.
//  Copyright © 2016 mundomo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var heroImageView: UIImageView!
  @IBOutlet weak var heroName: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func setData(imageName : String, name: String){
    heroImageView.image = UIImage(named: imageName)
    heroName.text = name
  }

}
