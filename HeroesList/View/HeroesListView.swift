//
//  HeroesListView.swift
//  DragonBallBase
//
//  Created by Pedro Martín on 16/1/23.
//

import Foundation
import UIKit

class HeroesListView: UIView {
    
    // CREATE HEADER VIEW
    
    let headerLabel = {
       let label = UILabel()
        
        label.text = "MVC"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    // CREATE TABLE VIEW
    
    let heroesTableView = {
        let tableView = UITableView()
//        tableView.backgroundColor = .blue
        tableView.register(HeroListViewCell.self, forCellReuseIdentifier: "HeroesListViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // CREATE / ADD SUBVIEWS
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        backgroundColor = .white
        
        addSubview(headerLabel)
        addSubview(heroesTableView)
        
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
//            heroesTableView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 50),
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
    }
 }
