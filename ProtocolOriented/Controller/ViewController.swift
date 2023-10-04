//
//  ViewController.swift
//  ProtocolOriented
//
//  Created by Halil YAŞ on 24.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel : UserViewModel
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configure() {
        view.backgroundColor = .white
        self.viewModel.delegate = self
        viewModel.fetchUsers()
        configureUI()
    }
    
    private func configureUI() {
        addSubviews()
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameLabel.snp.bottom).offset(50)
        }
    }
    
    private func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
    }

}

//MARK: - UserViewModelProtocol

extension ViewController : UserViewModelProtocol {
    func updateView(name: String, username: String, email: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = username
        self.emailLabel.text = email
    }
}

