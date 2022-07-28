//
//  WelcomeView.swift
//  GolfScoreExample
//
//  Created by Eric Bright on 7/28/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            viewModel.whichHole = 1
        } label: {
            Text("Click to Start")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
