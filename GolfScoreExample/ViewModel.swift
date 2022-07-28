//
//  ViewModel.swift
//  GolfScoreExample
//
//  Created by Eric Bright on 7/28/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var allHoles: [HoleData] = [
        HoleData(holeNumber: 1, par: 3, strokeIndex: 2, strokesPlayed: 1)
    ]
    
    @Published var whichHole: Int = 0
    
    var totalScore: Int {
        // I have no idea how to calculate golf scores, so you'll need to put the logic in here.  I'm assuming that the score is computed from all the above stuff somehow.
        return 5
    }
}
