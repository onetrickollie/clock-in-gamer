//
//  Persistence.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/24/24.
//

import Foundation



//class FileSystemData : ObservableObject {
//    var fileURL : URL
//    
//    init() {
//        let documentsDirectory =
//           FileManager.default.urls(for: .documentDirectory,
//           in: .userDomainMask).first!
//        let archiveURL =
//           documentsDirectory.appendingPathComponent("clockingamers")
//           .appendingPathExtension("json")
//
//        fileURL = archiveURL
//        print(fileURL)
//        loadData()
//    }
//    
//    func saveData() {
//        
//    }
//    func loadData() {
//        let propertyListDecoder = PropertyListDecoder()
//        if let retrievedData = try? Data(contentsOf: fileURL),
//            let decodedStrings = try? propertyListDecoder.decode([String].self, from: retrievedData) {
//            print(searchStrings)
//            searchStrings = decodedStrings
//        }
//    }
//}
