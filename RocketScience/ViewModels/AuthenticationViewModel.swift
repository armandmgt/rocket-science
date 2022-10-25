//
//  AuthenticationViewModel.swift
//  Rocket Science
//
//  Created by Armand Mégrot on 21/10/2022.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {

  enum SignInState {
    case signedIn
    case signedOut
  }

  @Published var state: SignInState = .signedOut

  func signIn() {
    if GIDSignIn.sharedInstance.hasPreviousSignIn() {
      GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
        authenticateUser(for: user, with: error)
      }
    } else {
      guard let clientID = FirebaseApp.app()?.options.clientID else { return }

      let configuration = GIDConfiguration(clientID: clientID)

      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
      guard let rootViewController = windowScene.windows.first?.rootViewController else { return }

      GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
        authenticateUser(for: user, with: error)
      }
    }
  }

  private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
    if let error = error {
      print(error.localizedDescription)
      return
    }

    guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }

    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

    auth().signIn(with: credential) { [unowned self] (_, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        self.state = .signedIn
      }
    }
  }

  func signOut() {
    GIDSignIn.sharedInstance.signOut()

    do {
      try auth().signOut()

      state = .signedOut
    } catch {
      print(error.localizedDescription)
    }
  }

  private func auth() -> Auth {
    let auth = Auth.auth()
//    if AppEnvironment.current == .local {
//      auth.useEmulator(withHost: "localhost", port: 9099)
//    }
    return auth
  }
}
