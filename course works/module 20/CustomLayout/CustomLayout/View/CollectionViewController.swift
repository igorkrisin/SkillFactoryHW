//
//  CollectionViewController.swift
//  CustomLayout
//
//  Created by Игорь Крысин on 11.01.2024.
//

import UIKit



class CollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "CollectionCell"
    
    var arrayImages = [ImageModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let i1 = UIImage(named: "i1")!
        let i2 = UIImage(named: "i2")!
        let i3 = UIImage(named: "i3")!
        let i4 = UIImage(named: "i4")!
        let i5 = UIImage(named: "i5")!
        let i6 = UIImage(named: "i6")!
        
        arrayImages.append(ImageModel(image: i1))
        arrayImages.append(ImageModel(image: i2))
        arrayImages.append(ImageModel(image: i3))
        arrayImages.append(ImageModel(image: i4))
        arrayImages.append(ImageModel(image: i5))
        arrayImages.append(ImageModel(image: i6))
        arrayImages.append(ImageModel(image: i2))
        arrayImages.append(ImageModel(image: i3))
        arrayImages.append(ImageModel(image: i4))
        arrayImages.append(ImageModel(image: i5))
        arrayImages.append(ImageModel(image: i6))
        arrayImages.append(ImageModel(image: i2))
        arrayImages.append(ImageModel(image: i3))
        arrayImages.append(ImageModel(image: i3))
        arrayImages.append(ImageModel(image: i4))
        arrayImages.append(ImageModel(image: i5))
        arrayImages.append(ImageModel(image: i6))
        
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegateLayout = self
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        cell.image.image = arrayImages[indexPath.row].image
    
        // Configure the cell
    
        return cell
    }

}

extension CollectionViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGSize {
        return arrayImages[indexPath.row].image.size
    }
    
   
}
