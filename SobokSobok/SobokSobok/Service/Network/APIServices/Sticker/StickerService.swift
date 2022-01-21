//
//  StickerService.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/01/20.
//

import Foundation
import Moya

enum StickerService {
    case checkSticker(scheduleId: Int)
    case postSticker(scheduleId: Int, stickerId: Int)
    case editSticker(likeScheduleId: Int, stickerId: Int)
}

extension StickerService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .checkSticker(let scheduleId):
            return URLs.checkStickerURL.replacingOccurrences(of: "{scheduleId}", with: "\(scheduleId)")
        case .postSticker(let scheduleId, _):
            return URLs.postStickerURL.replacingOccurrences(of: "{scheduleId}", with: "\(scheduleId)")
        case .editSticker(let likeScheduleId, _):
            return URLs.editStickerURL.replacingOccurrences(of: "{likeScheduleId}", with: "\(likeScheduleId)")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .checkSticker(_):
            return .get
        case .postSticker:
            return .post
        case .editSticker:
            return .put
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .checkSticker:
            return .requestPlain
        case .postSticker(_, let stickerId), .editSticker(_, let stickerId):
            return .requestParameters(parameters: ["stickerId": stickerId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .checkSticker, .postSticker, .editSticker:
            return APIConstants.headerWithToken
        }
    }
}
