//
//  ScheduleViewController+DataSource.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/06/22.
//

import UIKit

// MARK: - UICollectionViewDataSource

extension ScheduleViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ScheduleCell.reuseIdentifier,
            for: indexPath
        ) as? ScheduleCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: ScheduleHeaderView.reuseIdentifier,
            for: indexPath
        ) as? ScheduleHeaderView else { return UICollectionReusableView() }
        
        if indexPath.section != 0 { headerView.hideEditButton() }
        
        return headerView
    }
}
