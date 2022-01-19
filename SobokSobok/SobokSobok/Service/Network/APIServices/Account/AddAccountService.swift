//
//  SearchNicknameService.swift
//  SobokSobok
//
//  Created by 김선오 on 2022/01/19.
//

import Foundation
import Moya

enum AddAccountService {
    case searchNickname(username: String)
}

extension AddAccountService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .searchNickname(_):
            return URLs.getFriendsURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchNickname(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchNickname(let username):
            return .requestParameters(parameters: ["username": username], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .searchNickname:
            return [
                "Content-Type": "application/json",
                "accesstoken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImVtYWlsIjoidGVzdEBnbWFpbC5jb20iLCJuYW1lIjpudWxsLCJpZEZpcmViYXNlIjoiTnBRVmhYdUg3eVUwUkpVdUV6Zks3NldWckFGMiIsImlhdCI6MTY0MjA5MjkwMiwiZXhwIjoxNjQ0Njg0OTAyLCJpc3MiOiJ3ZXNvcHQifQ.fZ4bodbWJ3AlgD_c0oE5OyAW2WaXDeQHtApZLaZjdGI"
            ]
        }
    }
}
