//
//  ViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q  on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var tenDaysfromNow: Date {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: 10, to: Date(), options: [])!
    }
    var cityName = ""{
        didSet{
            forcastSearchView.cityLabel.text = "Weather forcast for \(cityName)"
            print(cityName)
            print(tenDaysfromNow)
        }
    }
    var searchValue = ""{
        didSet{
            ZipCodeHelper.manager.getLocationName(from: searchValue, completionHandler: {self.cityName = $0}, errorHandler: {print($0)})
        }
    }
    
    let cellSpacing: CGFloat = 12
    let forcastSearchView = ForcastSearchView()
    var forcast = [Forcast](){
        didSet{
            self.forcastSearchView.collectioView.reloadData()
            print("forcasts loaded successfuly")
            
        }
        
    }
    
    func getForcasts(for zipCode: Int){
        ForcastAPIClient.manager.getForcasts(for: zipCode.description, completionHandler: {self.forcast = $0}, errorHandler: {print($0)})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        self.view.addSubview(forcastSearchView)
        self.forcastSearchView.backGroundView.image = #imageLiteral(resourceName: "wave")
        self.forcastSearchView.collectioView.delegate = self
        self.forcastSearchView.collectioView.dataSource = self
        self.forcastSearchView.searchTextField.delegate = self
        //for numberPad usage implement a done botton
//        self.forcastSearchView.searchTextField.keyboardType = .numberPad
//        addDoneButtonOnKeyboard()
//        self.forcastSearchView.searchTextField.doneAccessory = true
    }
    // one way to add a done button in numeriacal pad https://stackoverflow.com/questions/28338981/how-to-add-done-button-to-numpad-in-ios-8-using-swift
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 350, height: 20))
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        self.forcastSearchView.searchTextField.inputAccessoryView = doneToolbar
        self.forcastSearchView.searchTextField.inputAccessoryView = doneToolbar
    }
    //action button for the numKeypad if it is used
    @objc func doneButtonAction()
    {
        self.forcastSearchView.searchTextField.resignFirstResponder()
        self.forcastSearchView.searchTextField.resignFirstResponder()
            guard let zipCode = Int(self.forcastSearchView.searchTextField.text!) else {
                return
            }
            self.searchValue = self.forcastSearchView.searchTextField.text!
            getForcasts(for: zipCode)
            self.forcastSearchView.searchTextField.resignFirstResponder()
            return

    }
    //this is a test function for the button to test the operation of the segueue between controllers
    @objc func testFunction(button: UIButton){
        let destinationViewController = DetailedWeatherViewController()
        // use that to present the detailed viewCOntroller try to check more about
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }

    func configureNavBar(){
        // Adding a Title to the navBar
        navigationItem.title =  "Search"
        //this is add the test function for the button to test the operation of the segueue between controllers
        forcastSearchView.testButton.addTarget(self, action: #selector(testFunction), for: UIControlEvents.touchUpInside)
    }
}

extension WeatherViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forcast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let forcastSetup = forcast[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityWeatherCell", for: indexPath) as! CustomSearchCollectionViewCell
        SetupCell(from: forcastSetup, and: cell)
        return cell
    }
    //collectionView cell setup
    func SetupCell(from forcastSetup: Forcast, and cell: CustomSearchCollectionViewCell){
        let date = forcastSetup.dateTimeISO.components(separatedBy: "-")
        let secondPart = date[2]
        let secondIndex = secondPart.index(secondPart.startIndex, offsetBy: 1)
        let dayDate = secondPart[secondPart.startIndex...secondIndex]
        cell.dateLabel.text = date[0...1].joined(separator: "-") + "-" + dayDate
        cell.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.05)
        cell.highTempLabel.text = "High: \(forcastSetup.maxTempC)°C"
        cell.lowTempLabel.text = "Low: \(forcastSetup.minTempC)°C"
        cell.conditionImage.image = UIImage(named: forcastSetup.icon)
    }
}
extension WeatherViewController: UICollectionViewDelegate{
    //seguing to the detailed viewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationViewController = DetailedWeatherViewController()
        destinationViewController.cityName = cityName
        let forcastSetup = forcast[indexPath.row]
        destinationViewController.forcast = forcastSetup
        destinationViewController.loadImages()
        // use that to present the detailed viewCOntroller try to check more about
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
}
extension WeatherViewController: UICollectionViewDelegateFlowLayout{
    //cell size setup and spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 3
        let numSpaces: CGFloat = numCells + 1
        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = UIScreen.main.bounds.height
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: collectionView.frame.height * 0.85)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: (cellSpacing - 10), left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
extension WeatherViewController: UITextFieldDelegate{
    //loading forcast when textfield has a valid zipCode
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let zipCode = Int(textField.text!) else {
            return false
        }
        self.searchValue = textField.text!
        getForcasts(for: zipCode)
        textField.resignFirstResponder()
        return true
    }
    
}
//another way to add a done button to the numeric pad also from the same reference
extension UITextField{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}


