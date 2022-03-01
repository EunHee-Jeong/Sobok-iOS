//
//  UIAlertController+Extension.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/02/23.
//

import UIKit

public func makeAlert(title: String, message: String, accept: String, vc: UIViewController, nextVC: UIViewController? = nil, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let acceptAction = UIAlertAction(title: accept, style: .default) { _ in
        guard let nextViewController = nextVC else { return }
        nextViewController.modalPresentationStyle = .fullScreen
        vc.present(nextViewController, animated: true)
    }
    let refuseAction = UIAlertAction(title: "취소", style: .default, handler: nil)
    [refuseAction, acceptAction].forEach {
        alert.addAction($0)
    }
    vc.present(alert, animated: true, completion: completion)
}

public func makeAcceptAlert(title: String, vc: UIViewController, nextVC: UIViewController, completion: @escaping () -> Void) {
    let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
    let acceptAction = UIAlertAction(title: "확인", style: .default) { _ in
        nextVC.modalPresentationStyle = .fullScreen
        vc.present(nextVC, animated: true, completion: completion)
    }
    alert.addAction(acceptAction)
    vc.present(alert, animated: true)
}
