//
//  ContentViewController.swift
//  Calender
//
//  Created by Simon on 2018/7/9.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import CoreData

class ContentViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myImgae: UIImageView!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var moneysView: UIView!
    @IBOutlet weak var usersView: UIView!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var moneyView: UIView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var noteText: UITextView!
    @IBOutlet weak var moneyText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var moneLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    var diary:DiaryUser!
    var date:String?
    @IBOutlet weak var myButton: UIButton!
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func saveButton(_ sender: UIButton) {
        if isSwitch.isOn == true{
            let alert = UIAlertController(title: "錯誤", message: "請把開關關掉", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let result = NSFetchRequest<NSFetchRequestResult>(entityName: "DiaryUser")
            let context = appDelegate.persistentContainer.viewContext
            do{
                let results = try context.fetch(result)
                if let totalDiary = diary.totalUser?.allObjects as? [TotalUser]{
                    totalDiary[0].user = userLabel.text
                    totalDiary[0].monay = moneLabel.text
                    totalDiary[0].note = noteLabel.text
                    if let diaryImage = myImgae.image{
                        if let imageData = UIImagePNGRepresentation(diaryImage){
                            totalDiary[0].accImage = NSData(data:imageData) as Data
                        }
                    }
                    appDelegate.saveContext()
                }
                dismiss(animated: true, completion: nil)
            }catch{
                
            }
        }
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        //收鍵盤
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImgae.image = image
            myImgae.contentMode = .scaleToFill
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
    @IBAction func mySwitch(_ sender: UISwitch) {
        if isSwitch.isOn == false{
            myButton.backgroundColor = UIColor(red: 199/255, green: 79/255, blue: 78/255, alpha: 1)
            userLabel.isHidden = false
            moneLabel.isHidden = false
            noteLabel.isHidden = false
            userLabel.text = userText.text
            moneLabel.text = moneyText.text
            noteLabel.text = noteText.text
            userText.isHidden = true
            moneyText.isHidden = true
            noteText.isHidden = true
            usersView.backgroundColor = UIColor(red: 199/255, green: 79/255, blue: 78/255, alpha: 1)
            moneysView.backgroundColor = UIColor(red: 199/255, green: 79/255, blue: 78/255, alpha: 1)
            notesView.backgroundColor = UIColor(red: 199/255, green: 79/255, blue: 78/255, alpha: 1)
        }else{
            myButton.backgroundColor = UIColor(red: 119/255, green: 124/255, blue: 168/255, alpha: 1)
            userLabel.isHidden = true
                moneLabel.isHidden = true
                noteLabel.isHidden = true
                userText.isHidden = false
                moneyText.isHidden = false
                noteText.isHidden = false
                userText.text = userLabel.text
                moneyText.text = moneLabel.text
                noteText.text = noteLabel.text
                usersView.backgroundColor = UIColor(red: 119/255, green: 124/255, blue: 168/255, alpha: 1)
            moneysView.backgroundColor = UIColor(red: 119/255, green: 124/255, blue: 168/255, alpha: 1)
            notesView.backgroundColor = UIColor(red: 119/255, green: 124/255, blue: 168/255, alpha: 1)
        }
    }
    @IBOutlet weak var isSwitch: UISwitch!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = date{
            dateLabel.text = date
        }
        if let diary = diary{
            if let totalDiary = diary.totalUser?.allObjects as? [TotalUser]{
            userLabel.text = totalDiary[0].user
            moneLabel.text = totalDiary[0].monay
            noteLabel.text = totalDiary[0].note
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
