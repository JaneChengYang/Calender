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
    @IBOutlet weak var myButton: UIButton!
    @IBAction func mySwitch(_ sender: UISwitch) {
        if isSwitch.isOn == false{
            myCollection.reloadData()
        myButton.backgroundColor = UIColor(red: 199/255, green: 79/255, blue: 78/255, alpha: 1)
        }else{
            myCollection.reloadData()
            myButton.backgroundColor = UIColor(red: 119/255, green: 124/255, blue: 168/255, alpha: 1)
        }
    }
    @IBOutlet weak var isSwitch: UISwitch!
    
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!

    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    var user = ["用途:","金額:","備註:"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ContentCollectionViewCell else {fatalError()}
        cell.userLabel.text = user[indexPath.row]
        if isSwitch.isOn == true{
            cell.addLabel.isHidden = true
            cell.addText.isHidden = false
            cell.myView.backgroundColor = UIColor(red: 119/255, green: 124/255, blue: 168/255, alpha: 1)
        }else{
            cell.addLabel.isHidden = false
            cell.addText.isHidden = true
            cell.myView.backgroundColor = UIColor(red: 199/255, green: 79/255, blue: 78/255, alpha: 1)
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
