//
//  NetworkManager.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 09/01/2023.
//

import Foundation
import Moya

protocol NetworkManagerDelegate {
    var provider: MoyaProvider<MultiTarget> {get}
    
    func postTranslateDetect(request: DetectRequest, completition: @escaping ((Result<DetectResponse, Error>) -> (Void)))
}

class NetworkManager: NetworkManagerDelegate {
   
    static let shared = NetworkManager()
    
    var provider = Moya.MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true, cURL: true)])
    
    func postTranslateDetect(request: DetectRequest, completition: @escaping ((Result<DetectResponse, Error>) -> (Void))) {
        requestData(target: TranslateAPI.detect(detectRequest: request), completion: completition)
    }
}

private extension NetworkManager {
    private func requestData<T: Decodable, M: TargetType>(target: M, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(MultiTarget(target)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(T.self,from: response.data)
                    completion(.success(result))
                }catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}
