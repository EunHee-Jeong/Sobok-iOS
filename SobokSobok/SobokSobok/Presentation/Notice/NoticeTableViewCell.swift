//
//  NoticeTableViewCell.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/01/09.
//

import UIKit

final class NoticeTableViewCell: UITableViewCell {

    static let cellIdentifier = "NoticeTableViewCell"
    
    // MARK: - @IBOutlet Properties
    @IBOutlet var noticeImage: UIImageView!
    @IBOutlet var noticeStatus: UILabel!
    @IBOutlet var noticeTime: UILabel!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(noticeData: NoticeListData) {
        noticeImage.image = noticeData.makeNoticeImage()
        noticeStatus.text = noticeData.noticeTitle
        noticeTime.text = noticeData.noticeTime
    }
}

// MARK: - Extensions
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
