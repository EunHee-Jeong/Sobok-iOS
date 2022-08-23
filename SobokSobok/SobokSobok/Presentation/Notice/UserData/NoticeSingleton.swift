//
//  NoticeSingleton.swift
//  SobokSobok
//
//  Created by 정은희 on 2022/08/10.
//

import Foundation

// 추후 리팩토링에 사용
@propertyWrapper struct NoticeDateFormatter {
    let dateFormatter = DateFormatter()
    var wrappedValue: Date
    
    var setDate: String {
        get { return wrappedValue.description }
        set {
            dateFormatter.dateFormat = FormatType.full.description
            self.wrappedValue = dateFormatter.date(from: newValue)!
            
        }
    }
    
    init(setDate: Date) {
        self.wrappedValue = setDate
    }
}
