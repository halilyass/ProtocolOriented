//
//  UserViewModel.swift
//  ProtocolOriented
//
//  Created by Halil YAŞ on 24.07.2023.
//

import Foundation

protocol UserViewModelProtocol: AnyObject {
    func updateView(name: String,username: String,email: String)
}

class UserViewModel {
    
    private let userService : UserService
    weak var delegate : UserViewModelProtocol?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.updateView(name: user.name, username: user.username, email: user.email)
            case .failure(_):
                self?.delegate?.updateView(name: "No User.!!", username: "", email: "")
            }
        }
    }
    
}
