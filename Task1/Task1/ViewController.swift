//
//  ViewController.swift
//  Task1
//
//  Created by GAVL DEV on 07/01/20.
//  Copyright © 2020 Harish. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 3
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCollectionViewCell", for: indexPath) as! pageCollectionViewCell
        cell.lblPageNo.text = "\(indexPath.row + 1)"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let svc = self.storyboard?.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController
        svc.sPageNo="\(indexPath.row+1)"
        self.navigationController?.pushViewController(svc, animated: true)
    
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }


}

