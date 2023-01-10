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
        "X-RapidAPI-Key": "5bc5970d0emsh80eb32d0e3a21f2p18f54ajsnb6e668314428",
        "X-RapidAPI-Host": "google-translate1.p.rapidapi.com"
    ]}
    var sampleData: Data {Data()}
    var method: Moya.Method {.post}
}
