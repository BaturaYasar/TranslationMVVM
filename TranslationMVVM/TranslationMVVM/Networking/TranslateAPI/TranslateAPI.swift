//
//  TranslateAPI.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 09/01/2023.
//

import Foundation
import Moya

enum TranslateAPI {
    case detect(detectRequest: DetectRequest)
}

extension TranslateAPI:BaseTarget {
    var path: String {
        switch self {
        case .detect:
            return "detect"
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .detect(let detectRequest):
//            return .requestJSONEncodable(detectRequest)
            return .requestParameters(parameters: ["q": detectRequest.q], encoding: URLEncoding.default)
        }
    }
    
}
