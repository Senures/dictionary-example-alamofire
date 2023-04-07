//
//  ApiClient.swift
//  turkishDictionary
//
//  Created by SEMANUR ESERLER on 29.03.2023.
//

import Foundation
import Alamofire


class ApiClient{
    
    static let apiClient = ApiClient()
    
     init() {
         print("apiclient calıstıııı")
     }
    
    func fetchDictionaryElement (params:String, succesData: @escaping ([DictionaryModel]) -> Void)  {
        
        print("fetchhhhhh")
        var baseUrl="https://sozluk.gov.tr/gts?ara=\(params)"
        print(baseUrl)
        AF.request(baseUrl, method: .get, encoding:URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            
            guard let data = responseData.data else { return }
            
            do{
                print(baseUrl)
                let data = try JSONDecoder().decode([DictionaryModel].self, from: data)
                print(data[0].anlamlarListe[0].anlam)
                succesData(data)
             
                
            } catch {
                print("catch bloğu")
            }
            
        }
    }
    
    

}

