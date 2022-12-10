//
//  NetworkError.swift
//  CovidMVVM
//
//  Created by choi young jun on 2022/12/10.
//

import Foundation
import Alamofire

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
