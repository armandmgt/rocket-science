//
//  LoginView.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 21/10/2022.
//

import SwiftUI

struct LoginView: View {

  @EnvironmentObject var viewModel: AuthenticationViewModel

  var body: some View {
    VStack {
      Spacer()

      Image("header_image")
        .resizable()
        .aspectRatio(contentMode: .fit)

      Text("Welcome to Rocket Science!")
        .fontWeight(.black)
        .foregroundColor(.accentColor)
        .font(.largeTitle)
        .multilineTextAlignment(.center)

      Text("A multi-purpose experimentation app written in Swift")
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()

      Spacer()

      GoogleSignInButton()
        .padding()
        .onTapGesture {
          viewModel.signIn()
        }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView().environmentObject(AuthenticationViewModel())
  }
}
