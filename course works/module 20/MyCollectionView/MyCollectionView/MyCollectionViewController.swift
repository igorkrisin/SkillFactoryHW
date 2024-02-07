//
//  ViewController.swift
//  MyCollectionView
//
//  Created by Игорь Крысин on 09.01.2024.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cellReuseIdentifier = "CustomItemCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayCustomCell = [CustomItemModel]()
    var arrayCell = [ModelItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: cellReuseIdentifier, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        
        arrayCustomCell.append(CustomItemModel(image: "temp.orange", topLabel: "first element", bottomLabel: "orange"))
        
        arrayCustomCell.append(CustomItemModel(image: "temp.red", topLabel: "second element", bottomLabel: "red"))
        
        arrayCustomCell.append(CustomItemModel(image: "temp.green", topLabel: "third element", bottomLabel: "green"))

        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCustomCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? CustomItemCell {
            cell.image.image = UIImage(named: self.arrayCustomCell[indexPath.row].image)
            cell.labelBottom.text = arrayCustomCell[indexPath.row].bottomLabel
            cell.labelTop.text = arrayCustomCell[indexPath.row].topLabel
            return cell
        }
        return UICollectionViewCell()
        
    }
    
}
