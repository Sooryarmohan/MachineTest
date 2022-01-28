//
//  ProductCollectionViewCell.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 28/01/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var imgTruck: UIImageView!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var lblDiscountPrice: UILabel!
    
    @IBOutlet weak var lblActualPrice: UILabel!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var imgOffer: UILabel!
    
    var products : Values?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        self.btnAdd.layer.cornerRadius = 8.0
        
        if products?.is_express == true{
            imgTruck.isHidden = false
        }else{
            imgTruck.isHidden = true
        }
        
        if products?.offer ?? 0 > 0{
            imgOffer.isHidden = false
        }else{
            imgOffer.isHidden = true
        }
        
        
        imgProduct.sd_setImage(with: URL(string: products?.image ?? ""), placeholderImage: UIImage(named: "profileIcon"))
        lblActualPrice.text =  products?.actual_price
        lblDiscountPrice.text =  products?.offer_price
        lblDesc.text = products?.name
        
        if lblActualPrice.text == lblDiscountPrice.text{
            lblActualPrice.isHidden = true
        }else{
            lblActualPrice.isHidden = false
        }
    }
    
}
