//
//  DiaryViewController.swift
//  Calender
//
//  Created by Simon on 2018/6/28.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import BubbleTransition

class DiaryViewController: UIViewController,UIViewControllerTransitioningDelegate{
    var diary:DiaryUser?
    var date:String?
    //日記
    @IBOutlet weak var diaryTextView: UITextView!
    //心情圖
    @IBOutlet weak var moodImage: UIImageView!
    //天氣圖
    @IBOutlet weak var weatherImage: UIImageView!
    //每日一句
    @IBOutlet weak var diaryWeatherLabel: UILabel!
    //日期label
    @IBOutlet weak var myLabel: UILabel!
    //返回按鈕
    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    //圖片
    @IBOutlet weak var myImage: UIImageView!
    //特效按鈕
    @IBAction func accountButton(_ sender: UIButton) {
    }
    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var myButton: UIButton!
    let transition = BubbleTransition()
    //更新
    @IBAction func unwindToLoversPage(segue: UIStoryboardSegue) {
//        if let source = segue.source as? EditViewController,let diarys = source.diary{
//            self.diary = diarys
//        }
    }
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addController = segue.destination as? EditViewController {
            addController.diary = self.diary
            addController.date = myLabel.text
        }else{
            let addController = segue.destination as? AccountViewController
            addController?.date = myLabel.text
            addController?.diary = self.diary
        }
        let controller = segue.destination
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.duration = 0.4
        transition.startingPoint = acButton.center
        transition.bubbleColor = acButton.backgroundColor!
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.duration = 0.5
        transition.startingPoint = acButton.center
        transition.bubbleColor = acButton.backgroundColor!
        return transition
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let date = date{
            myLabel.text = date
        }
        if let diary = diary{
            diaryWeatherLabel.text = diary.diaryLabel
            if let weatherImage = diary.weather{
                if weatherImage == ""{
                    self.weatherImage.image = UIImage(named: "18")
                }else{
                    self.weatherImage.image = UIImage(named: weatherImage)
                }
            }
            if let moodImage = diary.mood{
                if moodImage == ""{
                    self.moodImage.image = UIImage(named: "23")
                }else{
                    self.moodImage.image = UIImage(named:moodImage)
                }
            }
            if diary.diaryImage == nil{
                myImage.image = UIImage(named:"4")
                myImage.contentMode = .center
            }else if diary.diaryImage != nil{
                myImage.image = UIImage(data: diary.diaryImage!)
                myImage.contentMode = .scaleToFill
            }
            diaryTextView.text = diary.diary
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
