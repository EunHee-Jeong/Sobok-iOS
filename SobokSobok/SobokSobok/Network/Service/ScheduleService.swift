//
//  ScheduleService.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/06/30.
//

import Foundation

protocol ScheduleServiceable {
    func getMySchedule(for date: String) async throws -> [Schedule]?
}

struct ScheduleManager: ScheduleServiceable {
    private let apiService: Requestable
    private let environment: APIEnvironment
    
    init(apiService: Requestable, environment: APIEnvironment) {
        self.apiService = apiService
        self.environment = environment
    }
    
    func getMySchedule(for date: String) async throws -> [Schedule]? {
        let request = ScheduleEndPoint
            .getMySchedule(date: date)
            .createRequest(environment: environment)
        return try await self.apiService.request(request)
    }
}
