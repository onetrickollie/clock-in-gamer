//
//  Login.swift
//  Clock-In-Gamers
//
//  Created by Victor Mercado on 7/26/24.
//

import SwiftUI

func isValidUser() -> Bool {
    return true;
}

struct Login: View {
    @State var userName = ""
    @State var password = ""
    @State var shouldNavigate: Bool = false
    @State var errorLoggingIn: Bool = false
//    @EnvironmentObject var theUser : User
    @EnvironmentObject var appData : AppData
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Username:")
                            TextField("userName", text: $userName)
                                .background(Color.white)
                            .foregroundColor(.black)
                            .font(.title2)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Password:")
                            TextField("password", text: $password)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .font(.title2)
                        }

                    }
                    .padding(20)
                    
                    VStack {
                        if errorLoggingIn {
                            Text("Wrong username or password")
                            Text("Try again")
                        }
                        Button(action: {
                            if isValidUser() {
                                errorLoggingIn = false;
                                shouldNavigate = true
                            } else {
                                errorLoggingIn = true;
                            }
                            print("submitting")
                        }) {
                            HStack {
                                Text("Submit")
                                Image(systemName: "arrow.right")
                            }
                        }
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(3.0)
                    }
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    AppNavigation().navigationBarBackButtonHidden(true)
                }
                .modifier(MainBackground())
            }
        }
        .edgesIgnoringSafeArea(.all) // Extend the view to the edges of the screen
    }
}

#Preview {
    Login()
}
