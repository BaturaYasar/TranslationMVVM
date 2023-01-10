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
    case language
    case translate(translateRequest: TranslateRequest)
}

extension TranslateAPI:BaseTarget {
    var path: String {
        switch self {
        case .detect:
            return "detect"
        case .language:
            return "languages"
        case .translate:
            return ""
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .detect(let detectRequest):
//            return .requestJSONEncodable(detectRequest)
            return .requestParameters(parameters: ["q": detectRequest.q], encoding: URLEncoding.default)
        case .language:
            return .requestPlain
        case .translate(translateRequest: let translateRequest):
            return .requestParameters(parameters: ["q": translateRequest.q, "target": translateRequest.target, "source": translateRequest.source], encoding: URLEncoding.default)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .language:
            return .get
        default:
            return .post
        }
    }
    
}
