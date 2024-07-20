//
//  ContentView.swift
//  TablesGame
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GameView()
        }
        .navigationTitle("Shaft Tables")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
