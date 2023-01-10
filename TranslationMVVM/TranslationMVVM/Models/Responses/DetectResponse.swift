//
//  DetectResponse.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 09/01/2023.
//

import Foundation

// MARK: - DetectResponse
struct DetectResponse: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let detections: [[Detection]]?
}

// MARK: - Detection
struct Detection: Codable {
    let language: String?
    let isReliable: Bool?
}
