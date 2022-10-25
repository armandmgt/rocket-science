//
//  RugbyCompetionsView.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 22/10/2022.
//

import SwiftUI

struct RugbyCompetionsView: View {
  @EnvironmentObject var viewModel: RugbyCompetitionsViewModel

  var body: some View {
    VStack {
      Button(action: viewModel.subscribe) {
        Text("Start sub")
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(.red)
          .cornerRadius(12)
          .padding()
      }

      List {
        ForEach(viewModel.competitions) { comp in
          Text(comp.name)
        }
      }
    }
  }
}

struct RugbyCompetionsView_Previews: PreviewProvider {
  static var previews: some View {
    RugbyCompetionsView().environmentObject(RugbyCompetitionsViewModel())
  }
}
