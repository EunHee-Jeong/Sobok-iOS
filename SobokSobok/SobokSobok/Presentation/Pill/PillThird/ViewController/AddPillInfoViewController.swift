//
//  AddPillInfoViewController.swift
//  SobokSobok
//
//  Created by 김승찬 on 2022/05/04.
//

import UIKit

final class AddPillInfoViewController: BaseViewController {
    
    let addPillInfoView = AddPillInfoView()
    
    let timeArray: [String] = ["오전 10:00", "오후 12:30", "오후 3:00", "오후 5:20", "오후 7:30", "오후 10:50"]
    
    var minHeight: CGFloat = UIScreen.main.bounds.height * 0.3
    var normalHeight: CGFloat = UIScreen.main.bounds.height * 0.5
    var expandedHeight: CGFloat = UIScreen.main.bounds.height * 0.9
    
    override func loadView() {
        self.view = addPillInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewPanGesture()
        assignDelegation()
    }
    
    override func style() {
        super.style()
        addPillInfoView.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomSheet()
    }
    
    private func assignDelegation() {
        addPillInfoView.pillPeriodTimeView.timeCollectionView.delegate = self
        addPillInfoView.pillPeriodTimeView.timeCollectionView.dataSource = self
    }
    
 
    
    private func setViewPanGesture() {
        let backgroundViewTap = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped(_:)))
        addPillInfoView.backgroundView.addGestureRecognizer(backgroundViewTap)
        addPillInfoView.backgroundView.isUserInteractionEnabled = true
        
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false
        view.addGestureRecognizer(viewPan)
    }
    
    @objc private func viewPanned(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGestureRecognizer.translation(in: self.view)
        
        switch panGestureRecognizer.state {
        case .began:
            setHeight(height: expandedHeight)
        case .changed:
            if normalHeight + translation.y > normalHeight {
                setHeight(height: expandedHeight)
            }
            
            if expandedHeight - translation.y < expandedHeight {
                setHeight(height: normalHeight)
            }
            
            if normalHeight - translation.y < minHeight {
                setHeight(height: 0)
                self.dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    
    @objc private func backgroundViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheet()
    }
    
    private func setHeight(height: CGFloat) {
        addPillInfoView.bottomSheetView.snp.remakeConstraints {
            $0.height.equalTo(height)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func showBottomSheet() {
        setHeight(height: normalHeight)
    }
    
    private func hideBottomSheet() {
        setHeight(height: expandedHeight)
        self.dismiss(animated: true, completion: nil)
    }
  

}

extension AddPillInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  addPillInfoView.pillPeriodTimeView.timeCollectionView.dequeueReusableCell(for: indexPath, cellType: TakePillTimeCollectionViewCell.self)
        
        cell.makeRoundedWithBorder(radius: 8, color: Color.darkMint.cgColor)
        cell.timeLabel.text = timeArray[indexPath.item]
        
        return cell
    }
    
    
}

extension AddPillInfoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
            return CGSize(width: timeArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.font(.pretendardRegular, ofSize: 17)]).width + 20, height: 32)
        
    }
}
