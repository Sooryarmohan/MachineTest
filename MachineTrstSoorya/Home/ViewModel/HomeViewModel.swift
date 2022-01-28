//
//  HomeViewModel.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import Foundation

import Alamofire

class HomeViewModel{
    
    //MARK: - Home Categories API Call
    
    func homeCategoriesFetchAPI(completion: @escaping([HomeData])-> Void){
        WebServices.sharedApiInstance.HomeApi(url: Helper.appUrl) { (result) in
            switch result {
            case .success(let result) :
                if result.status == true {
                    completion(result.homeData!)
                }else {
                    Helper.showAlert(message: "Something went wrong")
                }
            case .failure(let err) :
                print("API Error", err)
                Helper.showAlert(message: "Something went wrong")
                break
            }
        }
    }
}
