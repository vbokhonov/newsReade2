//
//  NewsResponce.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 04.06.2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case abcNews = "abc-news"
    case associatedPress = "associated-press"
    case bbcNews = "bbc-news"
}

enum Name: String, Codable {
    case abcNews = "ABC News"
    case associatedPress = "Associated Press"
    case bbcNews = "BBC News"
}
