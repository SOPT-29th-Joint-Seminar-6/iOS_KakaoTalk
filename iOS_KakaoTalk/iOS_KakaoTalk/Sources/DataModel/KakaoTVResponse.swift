//
//  KakaoTVResponse.swift
//  iOS_KakaoTalk
//
//  Created by 김인환 on 2021/12/03.
//

import Foundation

// MARK: - Response

struct KakaoTVResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [ThumbnailData]?
}

// MARK: - Datum

struct ThumbnailData: Codable {
    let id: Int
    let title, desc, thumbnailImageURL: String
    let isDeleted: Bool
    let videochannelID: Int
    let videos: [ThumbnailData]?

    enum CodingKeys: String, CodingKey {
        case id, title, desc
        case thumbnailImageURL = "thumbnailImageUrl"
        case isDeleted
        case videochannelID = "videochannelId"
        case videos
    }
}
