//
//  WebServices.swift
//  MachineTrstSoorya
//
//  Created by MacBook on 27/01/22.
//

import Foundation

import Alamofire

class WebServices{
    static var sharedApiInstance = WebServices()
    
    //MARK: - POST API's
       //MARK: - Home API Call
       func HomeApi(url:String,completion: @escaping (Result<HomeModel,Error>) -> ()) {
           LoadingIndicatorView.show()
           AF.request(url, method: .post, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
               LoadingIndicatorView.hide()
               if response.response?.statusCode == 200 {
                   guard let data = response.data else {return}
                   do {
                       let modeldata = try JSONDecoder().decode(HomeModel.self, from: data)
                       completion(.success(modeldata))
                   } catch let err {
                       completion(.failure(err))
                   }
               } else {
                   if response.response?.statusCode == 404{
                       Helper.showAlert(message: "Page Not Found!")
                       
                   }else if response.response?.statusCode == 401{
                       Helper.showAlert(message: "Unauthorized")
                       
                   }else if response.response?.statusCode == 400{
                       Helper.showAlert(message: "Unauthorized")
                       
                   }else if response.response?.statusCode == 500{
                       Helper.showAlert(message: "Internal Server Error")
                       
                   }else if response.response?.statusCode == 503{
                       Helper.showAlert(message: "Service Unavailable")
                       
                   }else{
                       Helper.showAlert(message: "Somthing Went Wrong!")
                       
                   }
               }
           }
       }
    
}
