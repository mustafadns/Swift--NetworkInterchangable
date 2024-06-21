//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

// Data'dan gelen bilgilerin parçalanarak işlevselleştirilmesi için yazılmış kod blokları
import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    //let webService = WebSevice()
    
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers () async {
        var resorce = ""
        if service.type == "Webservice" {
            resorce = Constans.Urls.usersExtencion
        }else {
            resorce = Constans.Paths.baseUrl
        }
        
        do {
            let users =  try await service.download(resorce)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch {
            print(error)
        }
    }
    
}

struct UserViewModel {
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
    
}
