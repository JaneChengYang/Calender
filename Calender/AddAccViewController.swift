//
//  AddAccViewController.swift
//  Calender
//
//  Created by Simon on 2018/6/28.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import CoreData

class AddAccViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    //var diary:DiaryUser!
    var diary:DiaryUser?
    var ui = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func myButton(_ sender: UIButton) {
        if ui == true{
            print("按妞 空")
            collectionView.reloadData()
            let alert = UIAlertController(title: "錯誤", message: "請輸入完整資訊", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            print("按扭 有")
            collectionView.reloadData()
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func returnButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    var user = ["用途:","金額:","備註:"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AddAccCollectionViewCell else{fatalError()}
        cell.userLabel.text = user[indexPath.row]
        if cell.addText.text == ""{
            ui = true
            print("空")
        }else if cell.addText.text != ""{
            ui = false
            print("有")
        }
        //設定陰影效果
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
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
