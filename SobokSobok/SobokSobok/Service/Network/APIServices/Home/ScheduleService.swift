//
//  ScheduleService.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/01/18.
//

import Foundation

import Moya

enum ScheduleService {
    case getCalendar(date: String)
}

extension ScheduleService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getCalendar:
            return URLs.getCalendarURL
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .getCalendar:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCalendar(let date):
            return .requestParameters(parameters: ["date": date], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getCalendar:
            return APIConstants.headerWithToken
        }
    }
}
