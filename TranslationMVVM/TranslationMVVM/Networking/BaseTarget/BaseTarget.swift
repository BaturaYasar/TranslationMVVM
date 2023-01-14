//
//  BaseTarget.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 09/01/2023.
//

import Foundation
import Moya

public protocol BaseTarget:TargetType {
    
}

public extension BaseTarget {
    var baseURL: URL {
        guard let url = URL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2") else {return URL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")!}
        return url
    }
    var headers: [String : String]? {[
        "content-type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "application/gzip",
        "X-RapidAPI-Key": "155d2168bbmshc6d6702ed9fa1e4p1e1a44jsnee4d94fb2f76",
        "X-RapidAPI-Host": "google-translate1.p.rapidapi.com"
    ]}
    var sampleData: Data {Data()}
    var method: Moya.Method {.post}
}
