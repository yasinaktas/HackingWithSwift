//
//  ContentView.swift
//  Deneme
//
//  Created by Yasin Aktaş on 9.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            Section{
                Text("Yasin")
                Text("Yakup")
                Text("Ayşe")
            }
            ForEach(1..<4){number in
                Text("\(number)")
            }
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
