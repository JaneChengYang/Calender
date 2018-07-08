//
//  AddAccountViewController.swift
//  Calender
//
//  Created by Simon on 2018/7/8.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import CoreData

class AddAccountViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var diary:DiaryUser?
    var date:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = date{
            dateLabel.text = date
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userView.layer.cornerRadius = 4.0
        userView.layer.borderWidth = 1.0
        userView.layer.borderColor = UIColor.clear.cgColor
        userView.layer.masksToBounds = false
        userView.layer.shadowColor = UIColor.gray.cgColor
        userView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        userView.layer.shadowRadius = 4.0
        userView.layer.shadowOpacity = 1.0
        userView.layer.masksToBounds = false
        userView.layer.shadowPath = UIBezierPath(roundedRect:userView.bounds, cornerRadius: userView.layer.cornerRadius).cgPath
        
        noteView.layer.cornerRadius = 4.0
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor.clear.cgColor
        noteView.layer.masksToBounds = false
        noteView.layer.shadowColor = UIColor.gray.cgColor
        noteView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
       noteView.layer.shadowRadius = 4.0
        noteView.layer.shadowOpacity = 1.0
        noteView.layer.masksToBounds = false
       noteView.layer.shadowPath = UIBezierPath(roundedRect:noteView.bounds, cornerRadius: noteView.layer.cornerRadius).cgPath
        
        moneyView.layer.cornerRadius = 4.0
        moneyView.layer.borderWidth = 1.0
        moneyView.layer.borderColor = UIColor.clear.cgColor
        moneyView.layer.masksToBounds = false
        moneyView.layer.shadowColor = UIColor.gray.cgColor
        moneyView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        moneyView.layer.shadowRadius = 4.0
        moneyView.layer.shadowOpacity = 1.0
        moneyView.layer.masksToBounds = false
        moneyView.layer.shadowPath = UIBezierPath(roundedRect:moneyView.bounds, cornerRadius: moneyView.layer.cornerRadius).cgPath
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if moneyText.text == ""{
            let alert = UIAlertController(title: "錯誤", message: "請輸入幾金額", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
//            //更新
//            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
//                
//            }
//            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
//                let result = NSFetchRequest<NSFetchRequestResult>(entityName: "DiaryUser")
//                let context = appDelegate.persistentContainer.viewContext
//                do{
//                    let results = try context.fetch(result)
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "yyyy/MM/dd"
//                    let date = dateFormatter.date(from: dateLabel.text!)
//
//                    diary?.totalUser.add
//                    diary?.date = date
//                    diary?.diaryLabel = diaryText.text
//                    diary?.diary = noteText.text
//                    diary?.mood = moodString
//                    diary?.weather = weatherString
//                    if let diaryImage = myImage.image{
//                        if let imageData = UIImagePNGRepresentation(diaryImage){
//                            diary?.diaryImage = NSData(data:imageData) as Data
//                        }
//                    }
//                    appDelegate.saveContext()
//                }catch{
//                }
//            }
            dismiss(animated: true, completion: nil)
        }
        
    }
    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImage.image = image
            myImage.contentMode = .scaleToFill
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        dismiss(animated: true, completion: nil)
    }

    func photograph(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func taoGesture(_ sender: UITapGestureRecognizer) {
         view.endEditing(true)
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "拍照", style: .default, handler: { (alerAction) in
            self.photograph()
        }))
        alertController.addAction(UIAlertAction(title: "從相簿選照片", style: .default, handler: { (alerAction) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
         view.endEditing(true)
        
    }
    @IBOutlet weak var noteText: UITextView!
    @IBOutlet weak var moneyText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var moneyView: UIView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
