//
//  WebService.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 22/09/2022.
//

import Foundation

struct WebService {
    
    func getData(url: URL, completion: @escaping([MovieModel]?) ->()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
              
                let movieDetails = try? JSONDecoder().decode([MovieModel].self, from: data)
                
                if movieDetails != nil {
                 //   print(movieDetails)
                completion(movieDetails)
               
                }
            }
        }.resume()

    }
}
