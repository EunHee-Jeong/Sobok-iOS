//
//  NoticeViewController.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/01/09.
//

import UIKit

final class NoticeViewController: UIViewController {
    // MARK: - Properties
    private var noticeList: [NoticeListData] = NoticeListData.dummy
//    var noticeList = NoticeList() {
//        didSet {
//            noticeListView.noticeListCollectionView.reloadData()
//        }
//    }
    let noticeListManager: NoticeServiceable = NoticeManager(apiService: APIManager(), environment: .development)
    private let noticeListView = NoticeListView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        view = noticeListView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegation()
        getNoticeList()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Extensions
extension NoticeViewController: NoticeFistControl {
    func assignDelegation() {
        noticeListView.noticeListCollectionView.delegate = self
        noticeListView.noticeListCollectionView.dataSource = self
    }
 }

 extension NoticeViewController: UICollectionViewDelegate { }

 extension NoticeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if noticeList.count == 0 {
            collectionView.setEmptyView(image: Image.illustOops, message: "아직 도착한 알림이 없어요!")
        } else { collectionView.restore() }

        return noticeList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = noticeListView.noticeListCollectionView.dequeueReusableCell(for: indexPath, cellType: NoticeListCollectionViewCell.self)
        // TODO: - 섹션에 따라 분기 처리 필요 (친구 요청, 약 전송)
        // 데이터 넣기 & 경고창
        // 버튼 클릭되면 클로저로 셀 위아래 뷰 숨겨주기
        
        /*
         서버통신 section별로 (enum 만들어놓은것)
         
         (switch 안쓰고 하는거)
         푸시할때 타입도 같이 넘겨줄수있음(필요없음)
         데이터 받으면 쎅션에 따라 타입 매칭해주고 -> 나누기
         */
        
//        cell.setData(noticeListData: noticeList[indexPath.row])
        cell.accept = { [weak self] in
            makeAlert(title: "지민지민님이 캘린더 공유를 요청했어요", message: "수락하면 상대방이 지안님의 캘린더를\n볼 수 있어요!", accept: "확인", viewController: self, nextViewController: PillInfoViewController.instanceFromNib())
        }
        cell.refuse = { [weak self] in
            makeAlert(title: "지민지민님의 캘린더 공유를 거절할까요?", message: "거절하면 상대방이 지안님의 캘린더를\n볼 수 없어요", accept: "확인", viewController: self) {
                // 서버통신 후 처리 (NoticdListView의 Cell 바뀌도록)
            }
        }
        return cell
    }
 }
