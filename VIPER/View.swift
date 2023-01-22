//
//  View.swift
//  DragonBallBase
//
//  Created by Pedro Martín on 17/1/23.
//

import Foundation
import UIKit

// ViewController
// Protocol
// reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with heroes: [Hero])
    func update(with error: String)
}

class HeroViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    var presenter: AnyPresenter?
    
    var heroes: [Hero] = []
    
    let heroesTableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(heroesTableView)
        heroesTableView.dataSource = self
        heroesTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        heroesTableView.frame = view.bounds
    }
    
    func update(with heroes: [Hero]) {
        DispatchQueue.main.async {
            self.heroes = heroes
            self.heroesTableView.reloadData()
        }
    }
    
    func update(with error: String) {
        debugPrint(error)
    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let hero = self.heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        
        return cell
    }
    
}
