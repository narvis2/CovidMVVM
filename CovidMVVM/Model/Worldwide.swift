//
//  Worldwid.swift
//  CovidMVVM
//
//  Created by choi young jun on 2022/12/10.
//

import Foundation

// ✅ Decodable 👉 역직렬화
struct Worldwide : Decodable {
    let updated: TimeInterval
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let todayRecovered: Int
    let active: Int
    let population: Int
    let affectedCountries: Int
}
