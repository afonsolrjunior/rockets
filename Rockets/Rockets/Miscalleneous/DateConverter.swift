//
//  DateConverter.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 06/02/2023.
//

import Foundation

class DateConverter {
    
    static let shared = DateConverter()
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy - HH:mm"
        return formatter
    }()
    
    private let isoDateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        return formatter
    }()
    
    private init() {}
    
    func formatDateString(_ dateString: String) -> String {
        guard let date = isoDateFormatter.date(from: dateString) else { return dateString }
        return formatter.string(from: date)
    }
    
}
