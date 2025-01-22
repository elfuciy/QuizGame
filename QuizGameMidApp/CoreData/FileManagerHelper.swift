//
//  FileManagerHelper.swift
//  QuizGameMidApp
//
//  Created by Elsever on 07.01.25.
//

import Foundation

class FileManagerHelper {
    var userArray = [UserModel]()
    let username = UserDefaults.standard.string(forKey: "username")
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files.first!.appendingPathComponent("quizGameMidApp")
        print(path)
        return path
    }
    
    func saveData(user: [UserModel]) {
        do {
            let data = try JSONEncoder().encode(user)
            let path = getFilePath()
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readData(completion: (([UserModel]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let user = try JSONDecoder().decode([UserModel].self, from: data)
                completion(user)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func updatePoints(points: Int) {
        readData { user in
            userArray = user
            if let user = userArray.firstIndex(where: {$0.username == username}) {
                userArray[user].point! += points
                saveData(user: userArray)
            }
        }
    }
}
