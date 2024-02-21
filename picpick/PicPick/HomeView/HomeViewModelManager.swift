//
//  HomeViewModelManager.swift
//  PicPick
//
//  Created by 신지연 on 2024/02/20.
//

import Foundation
import Alamofire

class HomeViewModelManager {
    
    //헤더 가져오는 함수 구현해야함
    //let header: HTTPHeaders = ["Authorization": UserDefaults.standard.string(forKey: "authKey")!]
    /*
    func getUserShareAlbumList( _ viewController: HomeViewController) {
        AF.request("http://43.202.194.234:8080/albums/shared", method: .get, headers: header).validate().responseDecodable(of: [AlbumModel].self) { response in
            switch response.result {
            case .success(let result):
                print("성공")
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserNonShareAlbumList( _ viewController: HomeViewController) {
        AF.request("http://43.202.194.234:8080/albums/noshared", method: .get, headers: header).validate().responseDecodable(of: [AlbumModel].self) { response in
            switch response.result {
            case .success(let result):
                print("성공")
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    */
    
}
