//
//  AccountViewController.swift
//  Calender
//
//  Created by Simon on 2018/6/26.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import BubbleTransition
import CoreData

class AccountViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIViewControllerTransitioningDelegate{
    var diary:DiaryUser?
    var total:TotalUser?
    var date:String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBAction func diaryButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func myButton(_ sender: UIButton) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if diary?.totalUser?.count != nil{
            return (diary?.totalUser?.count)!
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AccountCollectionViewCell else{fatalError()}
        cell.myImage.image = image[indexPath.row]
        cell.userLabel.text = "Daily necessities"
        cell.moneyLabel.text = "1000"
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
    
    var image = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = date{
            dateLabel.text = date
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myCollection.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ee"){
            
            present(controller, animated: true, completion: nil)
                }
    }
    
//    //特效按鈕
//    @IBOutlet weak var addButton: UIButton!
//    let transition = BubbleTransition()
//    
//    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let controller = segue.destination
//        controller.transitioningDelegate = self
//        controller.modalPresentationStyle = .custom
//    }
//    
//    // MARK: UIViewControllerTransitioningDelegate
//    
//    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .present
//        transition.duration = 0.4
//        transition.startingPoint = addButton.center
//        transition.bubbleColor = addButton.backgroundColor!
//        return transition
//    }
//    
//    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .dismiss
//        transition.duration = 0.5
//        transition.startingPoint = addButton.center
//        transition.bubbleColor = addButton.backgroundColor!
//        return transition
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? AddAccountViewController{
            controller.date = dateLabel.text
            controller.diary = self.diary
        }
    }
    

}
