//
//  AccountEndPoint.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/08/26.
//

import Foundation

enum AccountEndPoint {
    case getUserPillList
    case putUserNickNameEdit(username: String)
    case putFriendNicknameEdit(groupId: Int, memberName: String)
}

extension AccountEndPoint: EndPoint {
    var method: HttpMethod {
        switch self {
        case .getUserPillList:
            return .GET
        case .putUserNickNameEdit:
            return .PUT
        case .putFriendNicknameEdit:
            return .PUT
        }
    }
    
    var body: Data? {
        switch self {
        case .getUserPillList:
            return nil
        case .putUserNickNameEdit(let username):
            let body = ["username": username]
            return body.encode()
        case .putFriendNicknameEdit(_, let memberName):
            let query = ["memberName": memberName]
            return query.encode()
        }
    }
    
    func getURL(from environment: APIEnvironment) -> String {
        let baseURL = environment.baseURL
        switch self {
        case .getUserPillList:
            return "\(baseURL)/user/pill"
        case .putUserNickNameEdit(_):
            return "\(baseURL)/user/nickname"
        case .putFriendNicknameEdit(let groupId, _):
            return "\(baseURL)/group/\(groupId)/name"
        }
    }
    
    
}
