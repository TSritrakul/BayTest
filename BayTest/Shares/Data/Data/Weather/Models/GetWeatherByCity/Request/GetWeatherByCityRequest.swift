//
//  GetWeatherByCityRequest.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation

// MARK: - GetWeatherByCityRequest
struct GetWeatherByCityRequest: Codable {
    let q, appid: String?

    init(q: String?, appid: String?) {
        self.q = q
        self.appid = appid
    }
}
