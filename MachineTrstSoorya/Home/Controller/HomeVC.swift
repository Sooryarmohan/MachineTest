//
//  HomeVC.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var viewModel = HomeViewModel()
    
    var homeModel : [HomeData]?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
   
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Search Bar Settings
        if #available(iOS 13.0, *) {
            self.searchBar.searchBarStyle = .minimal
            self.searchBar.searchTextField.backgroundColor = .white
            self.searchBar.searchTextField.borderStyle = .none
            self.searchBar.searchTextField.layer.cornerRadius = 16
            self.searchBar.placeholder = "Search for Products, Shop, Brands & more"
            self.searchBar.searchTextField.font = UIFont(name: "Arial", size: 15)
            self.searchBar.searchTextField.textColor = .darkGray
        } else {
            // Fallback on earlier versions
           // self.searchBar.clearBackgroundColor()
        }
        
        checkConnectivity()
    }
        

}

//MARK: - Home Table View Logic
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeModel?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.homeModel?[indexPath.row].type == "category"{
            return 120.0
        }else if self.homeModel?[indexPath.row].type == "banners"{
                return 200.0
        }else if self.homeModel?[indexPath.row].type == "products"{
            return 311.0
        }else{
            return 0
        }
    }
    
    //MARK: - Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = self.homeModel?[indexPath.row]
        if currentModel?.type == "category"{
            if currentModel!.values!.count > 0{
                let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
                cell.selectionStyle = .none
                cell.category = currentModel!.values!
                return cell
            }
        }else if currentModel?.type == "banners"{
            if currentModel!.values!.count > 0{
                let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeBannerTableViewCell") as! HomeBannerTableViewCell
                cell.selectionStyle = .none
                cell.banner = currentModel!.values!
                return cell
            }
        }else if currentModel?.type == "products"{
            if currentModel!.values!.count > 0{
                let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeProductTableViewCell") as! HomeProductTableViewCell
                cell.selectionStyle = .none
                cell.product = currentModel!.values!
                return cell
            }
        }
        return UITableViewCell()
    }
}
    
//MARK:- API CALL
extension HomeVC{
    func checkConnectivity() {
        if Helper.checkInternetConnectivity() {
            viewModel.homeCategoriesFetchAPI { (result) in
                self.homeModel = result
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
            }
            
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}

