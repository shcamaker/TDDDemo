//
//  ViewModel.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/27.
//

import UIKit

class ViewModel: NSObject {
    var session: URLSessionProtocol = URLSession.shared
    
    func getData(url: URL, result: @escaping (Int) -> ()) {
        let task = session.myDataTask(with: url) { data, response, error in

            guard let data = data else { return }
            guard let value = try? JSONDecoder().decode([Int].self, from: data).first else { return }
            result(value)
        }
        task.resume()
    }

}
