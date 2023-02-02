//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Sena Uzun on 1.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Webservice())
    }
    var body: some View {
        NavigationView {
            List(userListViewModel.userList, id :\.id ){ user in
                VStack {
                    Text(user.name)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth : .infinity , alignment: .leading)
                    
                    Text(user.username)
                        .foregroundColor(.green)
                        .frame(maxWidth : .infinity , alignment: .leading)
                    
                    Text(user.email)
                        .foregroundColor(.black)
                        .frame(maxWidth : .infinity , alignment: .leading)
                }.navigationTitle(Text("User List")).font(.title2)
            }.task {
                await userListViewModel.downloadUsers()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
