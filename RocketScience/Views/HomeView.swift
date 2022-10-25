//
//  HomeView.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 21/10/2022.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel

  private let user = GIDSignIn.sharedInstance.currentUser
  private let rugbyCompViewModel = RugbyCompetitionsViewModel()

  var body: some View {
    NavigationView {
      VStack {
        HStack {
          VStack(alignment: .leading) {
            Text(user?.profile?.name ?? "")
              .font(.headline)

            Text(user?.profile?.email ?? "")
              .font(.subheadline)
          }

          Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .padding()

        RugbyCompetionsView().environmentObject(rugbyCompViewModel)

        Spacer()

        Button(action: viewModel.signOut) {
          Text("Sign out")
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12)
            .padding()
        }
      }
      .navigationTitle("Rocket Science")
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView().environmentObject( AuthenticationViewModel())
  }
}
