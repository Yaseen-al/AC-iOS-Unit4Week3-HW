//
//  SavedForcastView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/7/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SavedForcastView: UIView {
    lazy var savedForcastTableView: UITableView = {
        let tableView = UITableView(frame: self.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "savedForcast")
        return tableView
    }()
    lazy var collectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cView.backgroundColor = .orange
        cView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        return cView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        backgroundColor = .white
        setupViews()
    }
    private func setupViews(){
//        setupCollectioView()  // tableView required in the repo not a collection View
        setupSavedWeatherImagesTableView()
    }
    func setupCollectioView(){
        addSubview(collectioView)
    }
    func setupSavedWeatherImagesTableView() {
        addSubview(savedForcastTableView)
    }
}
