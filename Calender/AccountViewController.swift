//
//  AccountViewController.swift
//  Calender
//
//  Created by Simon on 2018/6/26.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import BubbleTransition

class AccountViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIViewControllerTransitioningDelegate{
    
    @IBAction func diaryButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func myButton(_ sender: UIButton) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
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

        // Do any additional setup after loading the view.
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
