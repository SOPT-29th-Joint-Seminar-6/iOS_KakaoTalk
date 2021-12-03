//
//  ViewFindService.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/12/03.
//

import Foundation
import Alamofire

struct ViewFindService {
    static let shared: ViewFindService = ViewFindService()
    
    func getThumbnail(completion: @escaping (ViewFindResponse?) -> (Void)) {
        let url: String = APIConstants.getArticle
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let dataRequest = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let decodedData = self.decodeData(value)
                completion(decodedData)
            case .failure(let err):
                print(err)
            }
        }
        
    }
    
    private func decodeData(_ data: Data?) -> ViewFindResponse? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil}
        guard let decodedData = try? decoder.decode(ViewFindResponse.self, from: data) else { print("Decode Error")
            return nil}
        return decodedData
    }
}
