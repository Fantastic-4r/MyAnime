//
//  DataModel.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import Foundation

class DataModel {
    var lists = [Animelist]()
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "AnimeListIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AnimeListIndex")
        }
    }
    
    init() {
        registerDefaults()
        loadChecklists()
        handleFirstTime()
    }
    
    func registerDefaults() {
        UserDefaults.standard.set(true, forKey: "FirstTime")
    }
    
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let animelist = Animelist(name: "Watching")
            let animelist2 = Animelist(name: "To Watch")
            let animelist3 = Animelist(name: "Watched")
            lists.append(animelist)
            lists.append(animelist2)
            lists.append(animelist3)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            print(lists)
        }
    }
    
    func sortChecklists() {
        lists.sort { list1, list2 in
            return list1.name.localizedStandardCompare(list2.name) == .orderedAscending
        }
    }
    
    //MARK: - Data Persistence
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Animelist].self, from: data)
                if(lists.count != 0) {
                    UserDefaults.standard.set(false, forKey: "FirstTime")
                }
                
                sortChecklists()
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
}