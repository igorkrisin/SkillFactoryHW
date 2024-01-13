//
//  ViewController.swift
//  TemperatureSmileCollectionApp
//
//  Created by Игорь Крысин on 12.01.2024.
//

import UIKit

class OneViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayImageName: [String] = ["temp.blackGreen", "temp.darkYellow", "temp.green", "temp.lightYellow", "temp.orange", "temp.red"]
    
    var arraySmile: [String] = ["favorite", "nice", "notPleasant", "routine", "bad", "hate"]
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.dataSource = self
        collectionViewOne.delegate = self
        
        
        collectionViewTwo.dataSource = self
        collectionViewTwo.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
            return arrayImageName.count
        }
        if collectionView == collectionViewTwo {
            return arraySmile.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOne {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ViewCell {
                cell.setTemperatureImage(name: arrayImageName[indexPath.row])
                return cell
            }
        }
        if collectionView == collectionViewTwo  {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? ViewCell {
                cell.setSmileImage(name: arraySmile[indexPath.row])
                return cell
            }
        }
        
        return UICollectionViewCell()
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? SmileViewController else { return }
        
 
            
            var currentSelectedImage = arrayImageName[indexPath.row]
        if collectionView == collectionViewOne {
            vc.setImageName(name: currentSelectedImage)
        } else {
            vc.setImageName(name: arraySmile[indexPath.row])
        }
            present(vc, animated: true, completion: nil)
        
    }
}

