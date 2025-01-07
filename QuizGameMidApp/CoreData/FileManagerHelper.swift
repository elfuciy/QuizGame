//
//  FileManagerHelper.swift
//  QuizGameMidApp
//
//  Created by Elsever on 07.01.25.
//

import Foundation

class FileManagerHelper {
    
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
            print(data)
            do {
                let user = try JSONDecoder().decode([UserModel].self, from: data)
                completion(user)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func updatePoints(user: [UserModel], points: Int) {
            var userPoints = user.filter { $0.username == UserDefaults.standard.string(forKey: "username")}.first
            userPoints?.point = points
            saveData(user: user)
    }
}
