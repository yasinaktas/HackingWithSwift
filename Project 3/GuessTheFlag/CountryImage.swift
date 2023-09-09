//
//  CountryImage.swift
//  GuessTheFlag
//
//  Created by Yasin Aktaş on 6.09.2023.
//

import SwiftUI

struct CountryImage: View {
    var country: String
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius:5)
    }
}

