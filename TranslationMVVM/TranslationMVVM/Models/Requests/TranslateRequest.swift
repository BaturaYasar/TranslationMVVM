//
//  TranslateRequest.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 10/01/2023.
//

import Foundation

struct TranslateRequest:Codable {
    var q: String
    var target: String
    var source: String?
}
