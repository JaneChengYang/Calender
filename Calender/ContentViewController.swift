//
//  ContentViewController.swift
//  Calender
//
//  Created by Simon on 2018/7/1.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var diary:DiaryUser!
    
    var user = ["用途:","金額:","備註:"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ContentCollectionViewCell else {fatalError()}
        cell.userLabel.text = user[indexPath.row]
        if indexPath.row == 0{
            cell.addText.text = diary.user
        }else if indexPath.row == 1{
            cell.addLabel.text = String(diary.money)
        }else if indexPath.row == 2 {
            cell.addLabel.text = diary.note
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
