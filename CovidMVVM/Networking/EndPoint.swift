//
//  EndPoint.swift
//  CovidMVVM
//
//  Created by choi young jun on 2022/12/10.
//

import Foundation
import Alamofire

struct EndPoint {
    let path: String
    var queries: [String: Any]? = nil
}

// url 및 EndPoint 설정
extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "disease.sh"
        components.path = "/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

// Headers 설정
extension EndPoint {
    var headers: HTTPHeaders {
        [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
}

// Singleton 으로 EndPoint 인스턴스 생성
extension EndPoint {
    static var worldWide: Self {
        EndPoint(
            path: "v3/covid-19/all",
            queries: ["yesterday": "true"]
        )
    }
}
