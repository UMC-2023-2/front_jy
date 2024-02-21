//
//  HomeViewModel.swift
//  PicPick
//
//  Created by 신지연 on 2024/02/20.
//

import Foundation

struct AlbumModel : Decodable {
    var id : Bool
    var name : String
    var createdAt : String
    var titleImgUrl : String
    var sharedAlbumsIds: [Int]
    var feedIds: [Int]
}


