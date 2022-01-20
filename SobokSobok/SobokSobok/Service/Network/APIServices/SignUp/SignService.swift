//
//  SignUpService.swift
//  SobokSobok
//
//  Created by 김선오 on 2022/01/18.
//

import Foundation
import Moya

enum SignService {
    case signUp (email: String, password: String, name: String)
    case checkUsername (nickname: String)
}

extension SignService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return URLs.signUpURL
        case .checkUsername:
            return URLs.checkUsernameURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        case .checkUsername:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signUp(let email, let password, let name):
            return .requestParameters(parameters: [
                "email": email,
                "password": password,
                "name": name
            ], encoding: JSONEncoding.default)
        case .checkUsername(let nickname):
            return .requestParameters(parameters: ["nickname": nickname], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
            return ["Content-Type": "application/json"]
        }
}
