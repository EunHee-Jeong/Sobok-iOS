//
//  MainMessageView.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/06/20.
//

import UIKit

final class HomeTopView: BaseView {
    
    let mainMessageLabel = UILabel().then {
//        $0.setTypoStyle(typoStyle: .header1)
        $0.font = UIFont.font(.pretendardBold, ofSize: 24)
        $0.numberOfLines = 2
    }
    
    lazy var settingButton = UIButton().then {
        $0.setImage(Image.icMenu48, for: .normal)
    }
    
    override func setupView() {
        addSubviews(mainMessageLabel, settingButton)
    }
    
    override func setupConstraints() {
        mainMessageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(22)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(7)
        }
    }
}
