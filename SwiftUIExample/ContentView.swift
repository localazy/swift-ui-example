//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Jan Bilek on 13.07.2021.
//

import SwiftUI
import Localazy_iOS

final class ContentViewModel: ObservableObject {
    
    @Published var didLoadLocalizedStrings: Bool = false
    
    init() {
        NotificationCenter.default.publisher(for: .localazyStringsLoaded)
            .map { _ in true }
            .assign(to: &$didLoadLocalizedStrings)
    }
    
}

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    var body: some View {
        VStack{
                    
            Text(localazyKey: "Hello, Localazy!")
            .padding()
        }.onReceive(contentViewModel.$didLoadLocalizedStrings) { _ in
            print("stringy aktualizovane")}
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "cs"], id: \.self) { id in
            ContentView()
                .environment(\.locale, .init(identifier: id))
        }
    }
}
