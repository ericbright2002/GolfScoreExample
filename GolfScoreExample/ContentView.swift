//
//  ContentView.swift
//  GolfScoreExample
//
//  Created by Eric Bright on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.whichHole) {
            ForEach(0..<(viewModel.allHoles.count + 1), id: \.self) { index in
                if viewModel.whichHole == 0 {
                    WelcomeView()
                        .tag(index)
                } else {
                    FormView()
                        .tag(index)
                }
            }
        }
        .tabViewStyle(.page)
        .padding()
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
