//
//  FormView.swift
//  GolfScoreExample
//
//  Created by Eric Bright on 7/28/22.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            holeHeader
            Spacer()
            Text("Total Points: \(viewModel.totalScore)")
            Spacer()
            inputArea
            Spacer()
            if viewModel.whichHole == viewModel.allHoles.count {
                bottomButtons
                Spacer()
            } else {
                Spacer()
                Spacer()
            }
        }
        .padding()
    }
}

extension FormView {
    var holeHeader: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    if viewModel.whichHole > 1 {
                        viewModel.whichHole -= 1
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.green)
                }
                Spacer()
                Text("Hole \(viewModel.whichHole)")
                Spacer()
                Button {
                    if viewModel.whichHole < viewModel.allHoles.count {
                        viewModel.whichHole += 1
                    }
                } label: {
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.green)
                }
                Spacer()
            }
        }
    }
}

extension FormView {
    var inputArea: some View {
        VStack {
            Picker("Par", selection: $viewModel.allHoles[viewModel.whichHole - 1].par) {
                Text("Par 3").tag(3)
                Text("Par 4").tag(4)
                Text("Par 5").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            HStack {
                Spacer()
                Text("Stroke Index:")
                Spacer()
                Picker("Stroke Index", selection: $viewModel.allHoles[viewModel.whichHole - 1].strokeIndex) {
                    ForEach(1...18, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 75)
                .clipped()
                Spacer()
            }
            .padding()
            
            Stepper("Strokes Played: \(viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed)", value: $viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed, in: 1...20)
        }
    }
}

extension FormView {
    var bottomButtons: some View {
        HStack {
            Spacer()
            Button {
                if viewModel.allHoles.count < 18 {
                    viewModel.allHoles.append(HoleData(holeNumber: Int(viewModel.allHoles.count), par: 3, strokeIndex: 0, strokesPlayed: 1))
                }
                viewModel.whichHole += 1
            } label: {
                Text("Add Next Hole")
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(ViewModel())
    }
}
