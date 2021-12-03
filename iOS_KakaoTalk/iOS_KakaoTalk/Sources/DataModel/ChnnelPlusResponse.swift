//
//  ChnnelPlusResponse.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/12/03.
//

import Foundation

struct ChannelPlusResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [ChannelData?]
}

// MARK: - Datum
struct ChannelData: Codable {
    let id: Int
    let channelName: String
    let like: Int
    let channelDesc: String
    let isDeleted: Bool
    let createAt: String
    let friendCount: Int
    let channelImageURL: String

    enum CodingKeys: String, CodingKey {
        case id, channelName, like, channelDesc, isDeleted, createAt, friendCount
        case channelImageURL = "channelImageUrl"
    }
}
