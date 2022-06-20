//
//  NavigationView.swift
//  SobokSobok
//
//  Created by 김승찬 on 2022/03/01.
//

import UIKit

import SnapKit
import Then

final class NavigationView: UIView {

    private let navigationTitleLabel = UILabel().then {
        $0.text = "내 약 추가하기"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 17)
    }
    
    let xButton = UIButton().then {
        $0.setImage(Image.icBack48, for: .normal)
        $0.tintColor = Color.black
    }
    
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(Color.gray900, for: .normal)
    }
    
    lazy var bottomFirstView = UIView().then {
        $0.backgroundColor = Color.mint
    }
    
    lazy var bottomSecondView = UIView().then {
        $0.backgroundColor = Color.mint
    }
    
    lazy var bottomThirdView = UIView().then {
        $0.backgroundColor = Color.mint
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        [navigationTitleLabel, xButton, cancelButton,bottomFirstView, bottomSecondView, bottomThirdView].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        navigationTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).inset(13)
            $0.height.equalTo(24)
        }
        
        xButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).inset(1)
            $0.centerY.equalTo(navigationTitleLabel)
            $0.height.equalTo(48)
            $0.width.equalTo(48)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalTo(xButton)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(48)
            $0.height.equalTo(24)
        }
        
        bottomFirstView.snp.makeConstraints {
            $0.top.equalTo(xButton.snp.bottom).inset(-9)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 3)
            $0.height.equalTo(2)
        }
        
        bottomSecondView.snp.makeConstraints {
            $0.top.equalTo(xButton.snp.bottom).inset(-9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 3)
            $0.height.equalTo(2)
        }
         
        bottomThirdView.snp.makeConstraints {
            $0.top.equalTo(xButton.snp.bottom).inset(-9)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 3)
            $0.height.equalTo(2)
        }
    }
}
