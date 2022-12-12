//
//  TaskDefaultHelper.swift
//  TodoListApp
//
//  Created by Kaue de Assis Jacyntho on 12/12/22.
//

import Foundation

class TaskDefaultHelper {
    
    let kTask: String = "kTask"
    
    public func saveTaskList(taskList: [Task]) {
        do {
            let auxList = try JSONEncoder().encode(taskList)
            UserDefaults.standard.setValue(auxList, forKey: self.kTask)
        } catch {
            print(error)
        }
    }
    
    public func getTaskList() -> [Task]{
        do {
            guard let list = UserDefaults.standard.object(forKey: self.kTask) else { return [] }
            let auxList = try JSONDecoder().decode([Task].self, from: list as! Data)
            
            return auxList
        } catch {
            print(error)
        }
        
        return []
    }
    
    public func updateTask() {
        
    }
    
    public func deleteTaskList() {
        
    }
    
}
