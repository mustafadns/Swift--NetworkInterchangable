//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: WebSevice())
    }
    
    var body: some View {
        List (userListViewModel.userList, id: \.id) { user in
            VStack {
                Text(user.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(user.username)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.brown)
                Text(user.email)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.green)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
