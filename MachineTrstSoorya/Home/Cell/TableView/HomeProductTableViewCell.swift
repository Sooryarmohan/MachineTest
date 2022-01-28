//
//  HomeProductTableViewCell.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 28/01/22.
//

import UIKit

class HomeProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var product : [Values]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
    }

}
extension HomeProductTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        //Border corerRadius SetUp
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 5.0
        cell.layer.borderWidth = 1.0
        cell.products = product?[indexPath.item]
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 25.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.productCollectionView.bounds.size.width/2.3, height: self.productCollectionView.bounds.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }

}
