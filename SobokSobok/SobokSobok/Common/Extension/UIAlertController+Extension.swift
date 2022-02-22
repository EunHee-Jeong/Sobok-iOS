//
//  UIAlertController+Extension.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/02/23.
//

import UIKit

public func makeAlert(title: String, message: String, accept: String, vc: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let acceptAction = UIAlertAction(title: accept, style: .default, handler: nil)
    let refuseAction = UIAlertAction(title: "취소", style: .default, handler: nil)
    [acceptAction, refuseAction].forEach {
        alert.addAction($0)
    }
    vc.present(alert, animated: true)
}
