//
//  Pill.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/01/18.
//

import Foundation

struct PillList: Codable {
    let scheduleTime: String
    let scheduleList: [Pill]?
}

/*
 TODO: [수정 요청 하기]
 - 멤버 stickerId는 배열
 - 내 stickerId는 딕셔너리
 */
struct Pill: Codable {
    let scheduleId: Int
    let pillId: Int
    let pillName: String
    let isCheck: Bool
    let color: String
//    let stickerId: [String: Int]?
    let stickerTotalCount: Int
    let isLikedSchedule: Bool?
}

struct PillDetail: Codable {
    let scheduleId: Int
    let pillId: Int
    let userId: Int
    let scheduleDate: String
    let scheduleTime: String
    let isCheck: Bool
}
