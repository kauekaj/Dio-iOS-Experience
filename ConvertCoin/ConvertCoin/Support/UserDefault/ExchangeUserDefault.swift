//
//  ExchangeUserDefault.swift
//  ConvertCoin
//
//  Created by Kaue de Assis Jacyntho on 07/12/22.
//

import Foundation

class ExchangeUserDefault {
    
    let kHistory:String = "kHistory"
    
    public func save(listCoins:[Coin]) {
        do {
            let list = try JSONEncoder().encode(listCoins)
            UserDefaults.standard.setValue(list, forKey: self.kHistory)
        } catch {
            print(error)
        }
    }
    
    public func getListCoins() -> [Coin]{
        do {
            guard let list = UserDefaults.standard.object(forKey: self.kHistory) else { return []}
            let listAux = try JSONDecoder().decode([Coin].self, from: list as! Data)
            
            return listAux
        } catch {
            print(error)
        }
        
        return []
    }
}
