//
//  FavoriteViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
class FavoriteViewController: UIViewController {
    var savedPhotos = [Photo](){
        didSet{
            savedForcastView.savedForcastTableView.reloadData()
        }
    }
    let savedForcastView =  SavedForcastView()
    let cellSpacing: CGFloat = 12
    override func viewDidLoad() {
        view.backgroundColor = .white
        //        self.savedForcastView.collectioView.delegate = self
        //        self.savedForcastView.collectioView.dataSource = self
        self.view.addSubview(savedForcastView)
        self.savedForcastView.savedForcastTableView.delegate = self
        self.savedForcastView.savedForcastTableView.dataSource = self
        FileManagerHelper.manager.loadImages()
        self.savedPhotos = FileManagerHelper.manager.getAllPhotos()
    }
    override func viewWillAppear(_ animated: Bool) {
        FileManagerHelper.manager.loadImages()
        self.savedPhotos = FileManagerHelper.manager.getAllPhotos()
    }
    
}
extension FavoriteViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPhotos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoSetup = savedPhotos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedPhotosCell", for: indexPath) as! CustomTableViewCell
        cell.cellImage.image = #imageLiteral(resourceName: "bower-logo")
        //This will make a image path to check if it is already save as a PNG or not
        let imagePathName = photoSetup.webformatURL.components(separatedBy: "/").last!
        //this checks if there is an image saved in the fileManager or not
        if let image = FileManagerHelper.manager.getImage(with: imagePathName){
            cell.cellImage.image = image
        }else{
            ImageAPIClient.manager.getImage(from: photoSetup.webformatURL, completionHandler: {cell.cellImage.image = $0; cell.setNeedsLayout(); FileManagerHelper.manager.saveImage(with: imagePathName, image: $0)}, errorHandler: {print($0)})
        }
        return cell
    }
    
}
extension FavoriteViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.35
    }
}


/*
 extension FavoriteViewController: UICollectionViewDelegate{
 
 }
 extension FavoriteViewController: UICollectionViewDataSource{
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return 100
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
 cell.backgroundColor = .green
 return cell
 }
 }
 
 extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 let numCells: CGFloat = 1
 let numSpaces: CGFloat = numCells + 1
 
 let screenWidth = UIScreen.main.bounds.width
 let screenHeight = UIScreen.main.bounds.height
 
 return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenHeight * 0.35)
 }
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
 return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 return cellSpacing
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
 return cellSpacing
 }
 }
 */
