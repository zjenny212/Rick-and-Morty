//
//  DataManager.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import Foundation
import UIKit

let urlString = "https://rickandmortyapi.com/api/episode/"

class DataManager {
    private init() {}
    static let shared = DataManager()
    
    func getData(completion: @escaping (_ array:Episodes?, _ error:Error?)->()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            let res = response as! HTTPURLResponse
            if res.statusCode == 200 && error == nil{
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Episodes.self, from: data!)
                    completion(responseModel,nil)
                } catch {
                    print(error)
                    completion(nil,error)
                }
            } else {
                completion(nil,error)
                print(error?.localizedDescription ?? "error")
            }
        }.resume()
    }
    
    func getCharacter(url: URL?, completion: @escaping (_ array:Character?, _ error:Error?)->()) {
        URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            let res = response as! HTTPURLResponse
            if res.statusCode == 200 && error == nil{
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Character.self, from: data!)
                    completion(responseModel,nil)
                } catch {
                    print(error)
                    completion(nil,error)
                }
            } else {
                completion(nil,error)
                print(error?.localizedDescription ?? "error")
            }
        }.resume()
    }

    func getImgData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, completion:@escaping (UIImage?,Error?) -> ()) {
        print("Download Started")
        let img =  UIImage(named: "imgNotFound")
        getImgData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(img,nil)
                return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            completion(UIImage(data: data),nil)
        }
    }
}
