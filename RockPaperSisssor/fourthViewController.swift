//
//  fourthViewController.swift
//  RockPaperSisssor
//
//  Created by yeswanth varma on 1/23/17.
//  Copyright © 2017 yeswanth varma. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        CollectionView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Ccell", for: indexPath) as? CustomCollectionViewCell
        cell?.textHeader.text = "\(indexPath.item)"
        return cell!
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
