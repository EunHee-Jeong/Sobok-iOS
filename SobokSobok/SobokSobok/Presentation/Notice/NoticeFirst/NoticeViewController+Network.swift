//
//  NoticeViewController+Network.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/08/05.
//

extension NoticeViewController {
    func getNoticeList() {
        Task {
            do {
                let noticeList = try await noticeListManager.getNoticeList()
                if let noticeList = noticeList {
                    self.noticeList = noticeList
                }
            }
        }
    }
    
    func putAcceptFriend(senderGoupId: Int) {
        Task {
            do {
                _ = try await noticeListManager.putAcceptFriend(for: senderGoupId)
            }
        }
    }
}
