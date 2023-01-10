//
//  LanguageResponse.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 10/01/2023.
//

import Foundation

// MARK: - LanguageResponse
struct DataLanguageResponse: Codable {
    let data: LanguageResponse?
}

// MARK: - DataClass
struct LanguageResponse: Codable {
    let languages: [Language]?
}

// MARK: - Language
struct Language: Codable {
    let language: String?
}
