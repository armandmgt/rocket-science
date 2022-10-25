//
//  ContentView.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 21/10/2022.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var authViewModel: AuthenticationViewModel

  var body: some View {
    switch authViewModel.state {
    case .signedIn: HomeView().environmentObject(authViewModel)
    case .signedOut: LoginView().environmentObject(authViewModel)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(AuthenticationViewModel())
  }
}
