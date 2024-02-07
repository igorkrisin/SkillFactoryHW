//
//  ViewController.swift
//  ExploringCollectionView
//
//  Created by Игорь Крысин on 08.01.2024.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let reuseIdentifier = "itemCell"
    var arrayItems = [StructItem]()
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        arrayItems.append(StructItem(image: "temp.darkYellow", text: "Dark yellow color"))
        arrayItems.append(StructItem(image: "temp.orange", text: "Orange color"))
        arrayItems.append(StructItem(image: "temp.red", text: "Red color"))
        print(arrayItems)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemCell {
            cell.imageView.image = UIImage(named: arrayItems[indexPath.row].image)
            cell.labelView.text = arrayItems[indexPath.row].text
            print(cell)
            return cell
            
        }
            return UICollectionViewCell()
    }
    
    
}

