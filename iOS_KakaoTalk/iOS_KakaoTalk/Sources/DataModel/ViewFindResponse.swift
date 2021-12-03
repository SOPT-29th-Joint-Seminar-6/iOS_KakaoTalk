//
//  ViewFindResponse.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/12/03.
//

import Foundation

// MARK: - ViewFindResponse
struct ViewFindResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [ViewFindData]
}

// MARK: - Datum
struct ViewFindData: Codable {
    let id: Int
    let channelName: String
    let like: Int
    let channelDesc: String
    let isDeleted: Bool
    let createAt: String
    let friendCount: Int
    let channelImageURL: String
    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case id, channelName, like, channelDesc, isDeleted, createAt, friendCount
        case channelImageURL = "channelImageUrl"
        case articles
    }
}

// MARK: - Article
struct Article: Codable {
    let id: Int
    let title, writer: String
    let channelID: Int
    let isDeleted: Bool
    let postImageURL: String

    enum CodingKeys: String, CodingKey {
        case id, title, writer
        case channelID = "channelId"
        case isDeleted
        case postImageURL = "postImageUrl"
    }
}

