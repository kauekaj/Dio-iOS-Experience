//
//  Date.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 12/12/22.
//

import Foundation

extension Date {
    
    public func convertdateToString(date: Date, dateFormatter: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        
        formatter.dateFormat = dateFormatter ?? "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.string(from: yourDate!)
    }
    
    
    public func convertStringToDate(dateString: String, dateFormatter: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter ?? "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter.date(from: dateString) ?? nil
     
    }
}
