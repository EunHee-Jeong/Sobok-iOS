//
//  NoticeListModel.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/08/05.
//

import Foundation

struct NoticeList: Codable {
    let infoList: [InfoList]
}

struct InfoList: Codable {
    let noticeId: Int
    let section: String
    let isOkay: String
    let isSend: Bool
    let createdAt: String
    let senderName: String
    let pillName: String?
    let pillId: Int?
}