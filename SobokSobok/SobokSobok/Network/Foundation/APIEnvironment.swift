//
//  APIEnvironment.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/06/30.
//

import Foundation

enum APIEnvironment: String {
    case mock
    case development
    case production
}

extension APIEnvironment {
    var baseURL: String {
        switch self {
        case .mock:
            return "https://fd0fa608-9c5f-4cd0-9046-d1094434bab2.mock.pstmn.io"
        case .development:
            return "https://asia-northeast3-sobok-76d0a.cloudfunctions.net/api"
        case .production:
            return ""
        }
    }
    
    var token: String {
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTE5LCJuYW1lIjoi7LmY7KaI6rCQ7J6Q7YqA6rmAIiwiaWF0IjoxNjU5ODk0MDU3LCJleHAiOjE2NjI0ODYwNTcsImlzcyI6InNvYm9rIn0.Mqmzg3RJuDZiGjAdBGgOgLA7pijxfRTyNKh-bi1YHOw"
//        return UserDefaultsManager.accessToken
    }
}
