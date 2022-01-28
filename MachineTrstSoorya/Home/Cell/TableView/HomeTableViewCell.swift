//
//  HomeTableViewCell.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import UIKit

import SDWebImage


//MARK:- Home Category TableViewCell
class HomeTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
   
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var category  : [Values]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }


}

extension HomeTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = category?[indexPath.item].name
        cell.categoryImage.sd_setImage(with: URL(string: category?[indexPath.item].image_url ?? ""), placeholderImage: UIImage(named: "profileIcon"))
        cell.categoryView.layer.cornerRadius = cell.categoryView.frame.height / 2.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 107, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

}
