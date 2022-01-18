//
//  CalendarViewController+CollectionViewDataSource.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/01/18.
//

import UIKit

// MARK: - CollectionView

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {    
    /// section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        pillItems.count
    }
    
    /// row in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pillItems[section].scheduleList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            for: indexPath, cellType: MedicineCollectionViewCell.self
        )
        
        let pill = pillItems[indexPath.section].scheduleList?[indexPath.row]
        
        cell.contentView.backgroundColor = Color.white
        cell.contentView.makeRounded(radius: 12)
        cell.pillName.text = pill?.pillName
        
        cell.editButton.isHidden = !editMode
        cell.checkButton.isHidden = editMode
        
        if pill?.stickerImg?.count == 0 {
            cell.stickerStackView.isHidden = true
            cell.stickerCountLabel.isHidden = true
        } else {
            
        }
        
        cell.stickerClosure = { [weak self] in
            guard let self = self else { return }
            self.showStickerBottomSheet()
        }
        
        cell.editClosure = {
            self.showActionSheet()
        }
        
        cell.checkClosrue = {
            guard let scheduleId = pill?.scheduleId else { return }
            if cell.isChecked {
                self.checkPillDetail(scheduleId: scheduleId)
            } else {
                print(pill?.scheduleId, "해제 요청")
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: TimeHeaderView.reuseIdentifier,
                for: indexPath
            ) as? TimeHeaderView else { return UICollectionReusableView() }
            
            headerView.timeLabel.text = pillItems[indexPath.section].scheduleTime
            headerView.editButtonStackView.isHidden = indexPath.section != 0
            headerView.editModeClosure = {
                self.editMode.toggle()
            }
            
            return headerView
        default:
            assert(false, "헤더 뷰 찾을 수 없음")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 77
        return CGSize(width: width, height: height)
    }
}
