// To parse the JSON, add this file to your project and do:
//
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation




struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String
}

struct Source: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case abcNews = "abc-news"
}

enum Name: String, Codable {
    case abcNews = "ABC News"
}
