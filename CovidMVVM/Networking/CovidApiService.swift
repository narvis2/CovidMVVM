//
//  CovidApiService.swift
//  CovidMVVM
//
//  Created by choi young jun on 2022/12/10.
//

import Foundation
import Alamofire
import Combine

protocol CovidApiProtocol {
    func getWorldWideCovid(from endpoint: EndPoint) -> AnyPublisher<DataResponse<Worldwide, NetworkError>, Never>
}

struct CovidApi: CovidApiProtocol {
    func getWorldWideCovid(from endpoint: EndPoint) -> AnyPublisher<DataResponse<Worldwide, NetworkError>, Never> {
        print("getWorldWideCovid Called | url 👉 \(endpoint.url) | parameters: 👉 \(String(describing: endpoint.queries)) | headers 👉 \(endpoint.headers)")
        
        return AF.request(
            endpoint.url,
            method: .get,
            parameters: endpoint.queries,
            headers: endpoint.headers
        )
        .validate()
        .publishDecodable(type: Worldwide.self)
        .map { response in
            response.mapError { error in
                let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0) }
                return NetworkError(initialError: error, backendError: backendError)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher() // 지금까지의 데이터 스트림이 어떠했던 최종적인 형태의 Publisher를 리턴
    }
}
