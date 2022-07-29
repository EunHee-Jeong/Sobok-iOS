//
//  MainViewController+Network.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/06/30.
//

import Foundation

extension MainViewController {
    func getMySchedules(date: String) {
        Task {
            do {
                let schedules = try await scheduleManager.getMySchedule(for: date)
                if let schedules = schedules,
                   !schedules.isEmpty {
                    self.schedules = schedules
                }
            }
        }
    }
    
    func getMyPillLists(date: String) {
        Task {
            do {
                let pillLists = try await scheduleManager.getPillList(for: date)
                if let pillLists = pillLists,
                   !pillLists.isEmpty {
                    self.pillLists = pillLists
                }
            }
        }
    }
}
