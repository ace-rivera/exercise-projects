//
//  HeroesMainPageCollectionViewController.swift
//  VaingloryGuide
//
//  Created by Geraldine Forto on 19/07/2016.
//  Copyright © 2016 mundomo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CustomCollectionCell"
var heroes = [String]()
var images = [String]()

class HeroesMainPageCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      heroes = ["Adagio", "Alpha", "Ardan", "Blackfeather", "Catherine", "Celeste", "Fortress", "Glaive", "Joule", "Kestrel", "Koshka", "Krul", "Lance", "Lyra", "Ozo", "Petal", "Phinn", "Reim", "Ringo", "Rona", "Saw", "Skaarf", "Skye", "Taka", "Vox"]
      images = ["icon_adagio", "icon_alpha", "icon_ardan", "icon_blackfeather", "icon_catherine", "icon_celeste", "icon_fortress", "icon_glaive", "icon_joule", "icon_kestrel", "icon_koshka", "icon_krul", "icon_lance", "icon_lyra", "icon_ozo", "icon_petal", "icon_phinn", "icon_reim", "icon_ringo", "icon_rona", "icon_saw", "icon_skaarf", "icon_skye", "icon_taka", "icon_vox"]
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation", "return the number of items
        return 20
    }

    override func collectionView(collectionView: UICollectionView,cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier,forIndexPath: indexPath) as! CustomCollectionViewCell
    
        cell.setData(images[indexPath.row], name: heroes[indexPath.row])
    
        return cell
    }

  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    NSLog("\(indexPath.row)")
  }
}
