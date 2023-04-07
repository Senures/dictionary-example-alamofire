//
//  MovieDetailModel.swift
//  turkishDictionary
//
//  Created by SEMANUR ESERLER on 5.04.2023.
//

import Foundation
// MARK: - MovieDetailModel
struct MovieDetailModel: Codable {
    let createdBy, description: String
    let favoriteCount: Int
    let id: String
    let items: [Item]
    let itemCount: Int
    let iso639_1, name: String
   

    enum CodingKeys: String, CodingKey {
        case createdBy
        case description
        case favoriteCount
        case id, items
        case itemCount
        case iso639_1
        case name
       
    }
}

// MARK: - Item
struct Item: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let mediaType, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIDS
        case id
        case mediaType
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}


