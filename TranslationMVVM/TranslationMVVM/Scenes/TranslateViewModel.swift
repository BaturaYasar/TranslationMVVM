//
//  TranslateViewModel.swift
//  TranslationMVVM
//
//  Created by Mehmet Baturay Yasar on 10/01/2023.
//

import Foundation
import Moya

protocol TranslateViewModelDelegate {
    
    func updatePickerView()
    func translateText(text: String)
    func translateError(errorMessage: String)
    
}

final class TranslateViewModel {
    
    var delegate: TranslateViewModelDelegate
    var languageResponse: LanguageResponse?
    var detectResponse: DetectResponse?
    var translateResponse: TranslateResponse?
    var languagePickerCount: Int {
        guard let languageResponse = languageResponse?.languages else {return 0}
                return languageResponse.count
    }
    
    init(delegate: TranslateViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getLanguageTitle(row: Int) -> String {
        guard let languageResponseTitle = languageResponse?.languages?[row].language else {return ""}
        return languageResponseTitle
    }
    
    func getLanguageList() {
        NetworkManager.shared.getLanguages { result in
            switch result {
            case .success(let languageResponse):
                self.delegate.updatePickerView()
                self.languageResponse = languageResponse.data
            case .failure(let errorLanguage):
                print(errorLanguage)
            }
        }
    }
    
    func getTranslateText(request: TranslateRequest) {
        NetworkManager.shared.getTranslate(request: request) { result in
            switch result {
            case .success(let translateResponse):
                guard let translatedText = translateResponse.data?.translations?.first?.translatedText else {
                    self.delegate.translateError(errorMessage: "Translation couldn't have been done!")
                    return
                }
                self.delegate.translateText(text: translatedText)
            case .failure:
                self.delegate.translateError(errorMessage: "Try later on.")
            }
        }
    }
    
    func getDetectText() {
        let request = DetectRequest(q: "Hello, World!")
        NetworkManager.shared.postTranslateDetect(request: request) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
