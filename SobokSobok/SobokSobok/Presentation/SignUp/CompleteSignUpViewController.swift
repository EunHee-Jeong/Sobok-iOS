//
//  CompleteSignUpViewController.swift
//  SobokSobok
//
//  Created by 김선오 on 2022/01/16.
//

import UIKit

final class CompleteSignUpViewController: BaseViewController {

    // MARK: - Properties

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func style() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - @IBAction Properties
    @IBAction func touchUpToStart(_ sender: UIButton) {
        // 메인뷰로 화면 이동
        navigationController?.pushViewController(TabBarController.instanceFromNib(), animated: true)
    }
}
