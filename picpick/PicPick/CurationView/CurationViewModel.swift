//
//  CurationViewModel.swift
//  PicPick
//
//  Created by 신지연 on 2024/02/21.
//

import Foundation


struct FeedModel : Decodable {
    var memberId : Int
    var albumId : Int
    var content : String
    var photoIdList: [Int]
}

struct FeedListModel : Decodable {
    var feedIdList : [Int]
}
