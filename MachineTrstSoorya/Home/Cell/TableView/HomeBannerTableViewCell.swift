//
//  HomeBannerTableViewCell.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 28/01/22.
//

import UIKit
import SDWebImage

//MARK:- Home Banner TableViewCell
class HomeBannerTableViewCell: UITableViewCell  {
    
    //MARK: - IB Outlets
  
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var banner : [Values]?

    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
    }
}

extension HomeBannerTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        cell.bannerImage.sd_setImage(with: URL(string: banner?[indexPath.item].banner_url ?? ""), placeholderImage: UIImage(named: "profileIcon"))
        cell.bannerImage.layer.cornerRadius = 10.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bannerCollectionView.bounds.size.width, height: self.bannerCollectionView.bounds.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

}
