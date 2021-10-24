//
//  AssetLoader.swift
//  
//
//  Created by Yuki Okudera on 2021/10/24.
//

import UIKit

public enum AssetLoader {
    public static func loadWithDecode<T: Decodable>(
        name: String,
        decoder: () -> JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }
    ) -> T {
        let data = NSDataAsset(name: name, bundle: Bundle.module)!.data
        return try! decoder().decode(T.self, from: data)
    }
}
