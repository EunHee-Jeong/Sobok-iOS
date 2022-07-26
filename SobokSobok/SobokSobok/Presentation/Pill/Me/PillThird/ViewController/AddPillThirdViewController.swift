//
//  AddPillThirdViewController.swift
//  SobokSobok
//
//  Created by 김승찬 on 2022/04/30.
//

import UIKit

final class AddPillThirdViewController: UIViewController, TossPillProtocol {
 
    var type: TossPill = .myPill
    let timeArray: [String] = []
    let addPillThirdView = AddPillThirdView()
    let addPillInfoView = AddPillInfoView()
    
    override func loadView() {
        self.view = addPillThirdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegation()
        addPillThirdView.nextButton.addTarget(self, action: #selector(presentNextVC), for: .touchUpInside)
    }
    
    private func presentView() {
        let bottomSheetVC = AddPillInfoViewController()
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        bottomSheetVC.modalTransitionStyle = .crossDissolve
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
    
    private func setDelegation() {
        addPillThirdView.collectionView.delegate = self
        addPillThirdView.collectionView.dataSource = self
    }
    
    @objc func presentNextVC() {
        presentView()
    }
    
    func divide(style: PillStyle) {
        
        let navigationView = addPillThirdView.navigationView
        
        type = style.type
        
        [navigationView.bottomFirstView,
         navigationView.bottomSecondView].forEach {
            $0.isHidden = style.bottomNavigationBarIsHidden
        }
        
        [navigationView.sendBottomFirstView,
         navigationView.sendBottomSecondView,
         navigationView.sendBottomThirdView].forEach {
            $0.isHidden = style.sendBottomNavigationBarIsHidden
        }
    }
}

extension AddPillThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: AddPillCollectionViewCell.self)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let cell = addPillThirdView.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AddPillFooterView.reuseIdentifier, for: indexPath) as? AddPillFooterView else { return UICollectionReusableView()}
      
        return cell
    }
}

extension AddPillThirdViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 54)
    }
}
