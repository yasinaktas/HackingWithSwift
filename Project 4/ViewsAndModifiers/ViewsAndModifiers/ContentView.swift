//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yasin Aktaş on 5.09.2023.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.orange)
            .clipShape(Capsule())
    }
}

struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        content
        Text(text)
            .font(.caption)
            .foregroundColor(.white)
            .padding(5)
            .background(.black)
    }
}

struct LargeBlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
extension View {
    func largeBlueFonted() -> some View {
        modifier(LargeBlueFont())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
            Text("Yasin")
                .modifier(Watermark(text:"Aktaş"))
            Text("Yakup")
                .largeBlueFonted()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
