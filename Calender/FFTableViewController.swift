//
//  FFTableViewController.swift
//  Calender
//
//  Created by Simon on 2018/5/31.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import CoreData

class FFTableViewController: UITableViewController {
    //label和text
    @IBOutlet weak var breakfastText: UITextField!
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchText: UITextField!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerText: UITextField!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var snacksText: UITextField!
    @IBOutlet weak var snacksLabel: UILabel!
    @IBOutlet weak var socialText: UITextField!
    @IBOutlet weak var socialLabel: UILabel!
    @IBOutlet weak var dailyText: UITextField!
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var trafficText: UITextField!
    @IBOutlet weak var trafficLabel: UILabel!
    @IBOutlet weak var giftText: UITextField!
    @IBOutlet weak var giftLabel: UILabel!
    @IBOutlet weak var rentText: UITextField!
    @IBOutlet weak var rentLabel: UILabel!
    @IBOutlet weak var medicalTreatmentText: UITextField!
    @IBOutlet weak var medicalTreatmentLabel: UILabel!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var creditCardText: UITextField!
    @IBOutlet weak var creditCardLabel: UILabel!
    @IBOutlet weak var otherText: UITextField!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var InvestmentText: UITextField!
    @IBOutlet weak var InvestmentLabel: UILabel!
    
    var user:Users?
    //var money = [Moneny]()
    //var money:Moneny?
    var date:String?
    var total = 0
    var unwindTotal:Int?
    @IBAction func myButton(_ sender: UIButton) {
        if mySwitch.isOn == false{
            if totalLabel.text == "0"{
                dismiss(animated: true, completion: nil)
            }else{
                //存擋
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
                    user = Users(context: appDelegate.persistentContainer.viewContext)
                    let dateFormatters = DateFormatter()
                    dateFormatters.dateFormat = "yyyy/MM/dd"
                    let date = dateFormatters.date(from: myLabel.text!)
                    user?.date = date
                    user?.breakfash = breakfastLabel.text
                    user?.creditCard = creditCardLabel.text
                    user?.daily = dailyLabel.text
                    user?.dinner = dinnerLabel.text
                    user?.gift = giftLabel.text
                    user?.investment = InvestmentLabel.text
                    user?.lunch = lunchLabel.text
                    user?.medicalTreatment = medicalTreatmentLabel.text
                    user?.other = otherLabel.text
                    user?.phone = phoneLabel.text
                    user?.rent = rentLabel.text
                    user?.snacks = snacksLabel.text
                    user?.social = socialLabel.text
                    user?.traggic = trafficLabel.text
                    user?.total = Int64(totalLabel.text!)!
                    unwindTotal = Int(totalLabel.text!)
                    print(user)
                    appDelegate.saveContext()
                }
                dismiss(animated: true, completion: nil)
            }
        }else{
            let alertController = UIAlertController(title: "錯誤", message: "請把開關關掉", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    var moneys = [Use(use: "Breakfast:", money: "0"),Use(use: "Lunch:", money: "0"),Use(use: "Dinner:", money: "0"),Use(use: "Snacks:", money: "0"),Use(use: "Social:", money: "0"),Use(use: "Daily:", money: "0"),Use(use: "Traffic:", money: "0"),Use(use: "Gift:", money: "0"),Use(use: "rent:", money: "0"),Use(use: "Medical treatment:", money: "0"),Use(use: "Investment:", money: "0"),Use(use: "phone:", money: "0"),Use(use: "credit card:", money: "0"),Use(use: "other:", money: "0")]
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var arrayUse: [UILabel]!
    @IBOutlet var arrayLabel: [UILabel]!
    @IBOutlet var arrayText: [UITextField]!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(user?.date)
    }
    @IBAction func antSwitch(_ sender: UISwitch) {
//       if mySwitch.isOn == false{
//        for i in 0..<arrayText.count {
//            arrayText[i].isHidden = true
//            arrayLabel[i].isHidden = false
//                if arrayText[i].text != ""{
//                    total += Int(arrayText[i].text!) ?? 0
//                    arrayLabel[i].text = arrayText[i].text
//                    totalLabel.text = "\(total)"
//                    moneys[i].money = arrayText[i].text ?? ""
//                    money?.money = [arrayText[i].text ?? ""]
//                    money?.total = total
//                    unwindTotal = total
//                }
//            arrayLabel[i].text = arrayText[i].text
//            }
//        total = 0
//        }else{
//        for i in 0..<arrayText.count {
//            arrayText[i].isHidden = false
//            arrayLabel[i].isHidden = true
//                if arrayText[i].text != ""{
//                    total += Int(arrayText[i].text!) ?? 0
//                    arrayLabel[i].text = arrayText[i].text
//                    totalLabel.text = "\(total)"
//                    moneys[i].money = arrayText[i].text ?? ""
//                    money?.money = [arrayText[i].text ?? ""]
//                    money?.total = total
//                    unwindTotal = total
//                }
//            arrayLabel[i].text = arrayText[i].text
//            }
//        total = 0
//        }
        if mySwitch.isOn == false{
            add()
            off()
            breakfastLabel.text = breakfastText.text
            creditCardLabel.text = creditCardText.text
            dailyLabel.text = dailyText.text
            dinnerLabel.text = dinnerText.text
            giftLabel.text = giftText.text
            InvestmentLabel.text = InvestmentText.text
            lunchLabel.text = lunchText.text
            medicalTreatmentLabel.text = medicalTreatmentText.text
            otherLabel.text = otherText.text
            phoneLabel.text = phoneText.text
            rentLabel.text = rentText.text
            snacksLabel.text = snacksText.text
            socialLabel.text = socialText.text
            trafficLabel.text = trafficText.text
            total = 0
        }else{
            add()
            on()
            breakfastLabel.text = breakfastText.text
            creditCardLabel.text = creditCardText.text
            dailyLabel.text = dailyText.text
            dinnerLabel.text = dinnerText.text
            giftLabel.text = giftText.text
            InvestmentLabel.text = InvestmentText.text
            lunchLabel.text = lunchText.text
            medicalTreatmentLabel.text = medicalTreatmentText.text
            otherLabel.text = otherText.text
            phoneLabel.text = phoneText.text
            rentLabel.text = rentText.text
            snacksLabel.text = snacksText.text
            socialLabel.text = socialText.text
            trafficLabel.text = trafficText.text
            total = 0
        }
    }
    @IBOutlet weak var myLabel: UILabel!
    //開關的動作,關閉
    func off(){
        breakfastLabel.isHidden = false
        breakfastText.isHidden = true
        creditCardLabel.isHidden = false
        creditCardText.isHidden = true
        dailyLabel.isHidden = false
        dailyText.isHidden = true
        dinnerLabel.isHidden = false
        dinnerText.isHidden = true
        giftLabel.isHidden = false
        giftText.isHidden = true
        InvestmentLabel.isHidden = false
        InvestmentText.isHidden = true
        lunchLabel.isHidden = false
        lunchText.isHidden = true
        medicalTreatmentLabel.isHidden = false
        medicalTreatmentText.isHidden = true
        otherLabel.isHidden = false
        otherText.isHidden = true
        phoneLabel.isHidden = false
        phoneText.isHidden = true
        rentLabel.isHidden = false
        rentText.isHidden = true
        snacksLabel.isHidden = false
        snacksText.isHidden = true
        socialLabel.isHidden = false
        socialText.isHidden = true
        trafficLabel.isHidden = false
        trafficText.isHidden = true
    }
    //開關的動作,打開
    func on(){
        breakfastLabel.isHidden = true
        breakfastText.isHidden = false
        creditCardLabel.isHidden = true
        creditCardText.isHidden = false
        dailyLabel.isHidden = true
        dailyText.isHidden = false
        dinnerLabel.isHidden = true
        dinnerText.isHidden = false
        giftLabel.isHidden = true
        giftText.isHidden = false
        InvestmentLabel.isHidden = true
        InvestmentText.isHidden = false
        lunchLabel.isHidden = true
        lunchText.isHidden = false
        medicalTreatmentLabel.isHidden = true
        medicalTreatmentText.isHidden = false
        otherLabel.isHidden = true
        otherText.isHidden = false
        phoneLabel.isHidden = true
        phoneText.isHidden = false
        rentLabel.isHidden = true
        rentText.isHidden = false
        snacksLabel.isHidden = true
        snacksText.isHidden = false
        socialLabel.isHidden = true
        socialText.isHidden = false
        trafficLabel.isHidden = true
        trafficText.isHidden = false
    }
    //相加
    func add(){
        let breakfast = Int(breakfastText.text!) ?? 0
        let creditCard = Int(creditCardText.text!) ?? 0
        let daily = Int(dailyText.text!) ?? 0
        let dinner = Int(dinnerText.text!) ?? 0
        let gift = Int(giftText.text!) ?? 0
        let investment = Int(InvestmentText.text!) ?? 0
        let lunch = Int(lunchText.text!) ?? 0
        let medicalTreatment = Int(medicalTreatmentText.text!) ?? 0
        let other = Int(otherText.text!) ?? 0
        let phone = Int(phoneText.text!) ?? 0
        let rent = Int(rentText.text!) ?? 0
        let snacks = Int(snacksText.text!) ?? 0
        let social = Int(socialText.text!) ?? 0
        let traffic = Int(trafficText.text!) ?? 0
        total += breakfast + creditCard + daily + dinner + gift + investment + lunch + medicalTreatment + other + phone + rent + snacks + social + traffic
        totalLabel.text = String(total)
    }
    
    @IBOutlet weak var mySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<moneys.count{
            arrayUse[i].text = moneys[i].use
        }
        if let date = date{
            myLabel.text = date
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //讓表格被選取時不會反黑
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moneys.count
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        for i in 0..<moneys.count{
////            moneys[i].use = arrayUse[i].text ?? ""
////            moneys[i].money = arrayLabel[i].text ?? ""
////            moneys[i].money = arrayText[i].text ?? ""
////            //unwindTotal = Int(totalLabel.text!) ?? 0
////            money?.money = [arrayText[i].text ?? ""]
////        }
//        unwindTotal = Int(totalLabel.text!) ?? 0
////        if let unwindTotal = unwindTotal{
////            print("ok\(unwindTotal)")
////        if let money = money{
////            print("no\(money.money)")
////            print("yes\(money.total)")
////            }
////        }
//    }
   

}
