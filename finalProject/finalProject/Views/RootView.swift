//
//  ContentView.swift
//  finalProject
//
//  Created by Muneera Y on 13/02/1445 AH.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
