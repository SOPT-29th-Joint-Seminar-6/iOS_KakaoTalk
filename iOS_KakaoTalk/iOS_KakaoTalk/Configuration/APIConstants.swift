//
//  APIConstants.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/12/03.
//

import Foundation

struct APIConstants {
    static let baseURL: String = "https://asia-northeast3-server-again.cloudfunctions.net/api"
    
    static let getArticle: String = baseURL + "/view/viewfind"
    static let getKakaoTVThumbnail: String = baseURL + "/view/viewthumb"
    static let addPlusChannel: String = baseURL + "/channel"
    static let getPlusChannelInfo: String = baseURL + "/channel/"
}
