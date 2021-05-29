//
//  CompanyValuesPresenter.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import Foundation
import UIKit

//protocol UsersPresenterDelegate: AnyObject {
//    func presentUsers(users: [User])
//    func presentAlert(title: String, message: String)
//}
//
//typealias PresenterDelegate = UsersPresenterDelegate & UIViewController

protocol CompanyValuesPresenterProtocol {
    func didTapUserDetailsButton()
}

final class CompanyValuesPresenter: CompanyValuesPresenterProtocol {
    private weak var coordinator: CompanyValuesCoordinatorProtocol?
    weak var view: CompanyValuesViewController?
    
    init(coordinator: CompanyValuesCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapUserDetailsButton() {
        coordinator?.finish()
    }
    

    
//    // This is the reference for the viewController which is used interact with it.
//    weak var delegate: PresenterDelegate?
//
//    public func getUsers() {
//        guard let url = URL(string: Constants.usersUrl) else {
//            return
//        }
//
//        //Important to use weak self below to avoid the retain cycle.
//        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let users = try JSONDecoder().decode([User].self, from: data)
//                self?.delegate?.presentUsers(users: users)
////                print(users)
//            } catch {
//                print("ERROR: \(error.localizedDescription)")
//            }
//        }
//        task.resume()
//    }
//
//    public func didTap(user: User) {
//        delegate?.presentAlert(title: user.name, message: "\(user.name) has an email address of: \(user.email) and an username: \(user.username) ")
//    }
//
//    public func setViewDelegate(delegate: PresenterDelegate) {
//        self.delegate = delegate
//    }
    
}
