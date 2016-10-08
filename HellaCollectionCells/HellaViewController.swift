//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var fibo: [Int] = []
    
    override func viewDidLoad() {
        
        fibo = FibonacciNumber.getFibonacciSequence(upTo: 1000)
    
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! HellaCollectionViewCell
        
        cell.textLabel.text = "\(indexPath.row)"
        if fibo.contains(indexPath.row) {
            cell.backgroundColor = UIColor.purple
        } else {
            cell.backgroundColor = UIColor.yellow
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? HellaDetailViewController,
            let index = collectionView.indexPathsForSelectedItems,
            let cell = sender as? HellaCollectionViewCell {
            
            dest.textString = "\(index[0].row)"
            dest.view.backgroundColor = cell.backgroundColor
        }
    }
    
    
    
    
}

struct FibonacciNumber {
    static func getFibonacciSequence(upTo: Int) -> [Int]{
        var fibo: [Int] = [0, 1, 1]
        
        while fibo.last! < upTo {
            let lastInd = fibo.count - 1
            fibo.append(fibo[lastInd] + fibo[lastInd - 2])
        }
        return fibo
    }
    
}



















