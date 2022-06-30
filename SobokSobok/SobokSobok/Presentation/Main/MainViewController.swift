//
//  MainViewController.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/01/11.
//

import UIKit

import SnapKit

final class MainViewController: BaseViewController {

    private let homeTopView = HomeTopView()
    private let scheduleViewController = ScheduleViewController()
    private let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func style() {
        super.style()
        
        homeTopView.mainMessageLabel.text = "소중한 태끼님\n오늘도 약 꼭 챙겨 드세요"
        containerView.backgroundColor = .red
    }
    
    override func hierarchy() {
        view.addSubviews(homeTopView, containerView)
        addChild(scheduleViewController)
        containerView.addSubview(scheduleViewController.view)
    }
    
    override func layout() {
        homeTopView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40.adjustedHeight)
            $0.leading.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(homeTopView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        
        scheduleViewController.view.frame = containerView.bounds
        scheduleViewController.didMove(toParent: self)
    }
}
