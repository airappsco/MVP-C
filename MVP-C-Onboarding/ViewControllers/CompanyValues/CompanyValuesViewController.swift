//
//  ViewController.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import UIKit

final class CompanyValuesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: Constants.userCellId)
        return table
    }()
    
    private var presenter: CompanyValuesPresenterProtocol
    
    private var users = [User]()
        
    
    init(presenter: CompanyValuesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Air Apps Goals ⚽️ and Values 💎"
        view.backgroundColor = ThemeColors.companyValuesBackgroundColor
        
//        setupCoordinator()
        setupTableView()
//        setupPresenter()
//        presenter.getUsers()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//    private func setupPresenter() {
//        // Presenter setup
//        presenter.setViewDelegate(delegate: self)
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - TableView delegate and dataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCellId, for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        presenter.didTap(user: users[indexPath.row])
        // Presenter handle the tap
    }
    
    // MARK: -  Presenter delegate
    
    func presentUsers(users: [User]) {
        // Present users
        self.users = users

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        // Present alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

