//
//  PieChartViewController.swift
//  Calender
//
//  Created by Simon on 2018/7/21.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController{
    var diary:DiaryUser?
    var total:String?
    var start:CGFloat = 0
    var numberArray = [Double]()
    
    @IBOutlet weak var returnButton: UIButton!
    @IBAction func myButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func pieChart(radius:CGFloat,startAngle:CGFloat,endAngle:CGFloat,color:CGColor) {
        print(startAngle, endAngle)
        let path = UIBezierPath(arcCenter: view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: view.center)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color
        self.view.layer.addSublayer(layer)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let total = total{
            let totals = Double(total)
        if let diary = diary{
            if let totalDiary = diary.totalUser?.allObjects as? [TotalUser]{
                for i in 1...8{
                    if totalDiary[i].user == "美食"{
                        let randomColor = UIColor(red: 234/255, green: 50/255, blue: 35/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                            }
                    }else if totalDiary[i].user == "通勤"{
                        let randomColor = UIColor(red: 242/255, green: 157/255, blue: 78/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }else if totalDiary[i].user == "娛樂"{
                        let randomColor = UIColor(red: 252/255, green: 251/255, blue: 124/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }else if totalDiary[i].user == "電話"{
                        let randomColor = UIColor(red: 177/255, green: 251/255, blue: 163/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }else if totalDiary[i].user == "醫療"{
                        let randomColor = UIColor(red: 176/255, green: 252/255, blue: 254/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }else if totalDiary[i].user == "日常用品"{
                        let randomColor = UIColor(red: 110/255, green: 154/255, blue: 248/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }else if totalDiary[i].user == "飲料"{
                        let randomColor = UIColor(red: 144/255, green: 108/255, blue: 246/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }else if totalDiary[i].user == "其他"{
                        let randomColor = UIColor(red: 17/255, green: 237/255, blue: 238/255, alpha: 1)
                        let money:Double = Double(totalDiary[i].monay!)!
                        numberArray.append(money)
                        if UIScreen.main.sizeType == .iPhone5{
                            pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }else{
                            pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
                            start += CGFloat(2 * Double.pi / totals! * numberArray[i])
                        }
                    }
                }
//                for i in 0..<totalDiary.count{
//                    let money:Double = Double(totalDiary[i].monay!)!
//                    numberArray.append(money)
//                    let randomColor = UIColor.randomColor
//                    if UIScreen.main.sizeType == .iPhone5{
//                    pieChart(radius: 120, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
//                    // 我們使用一個圓 (2 * Double.pi) 來除以合計再乘以目前的數字，產生的結果就是我們目前數字的所佔 total 的比例。
//                    start += CGFloat(2 * Double.pi / totals! * numberArray[i])
//                    // 這邊的 start 必須加上之前的扇形範圍，才是正確的起始點
//                    //showColorPercent(centerX: 30, centerY: 30 * (i + 1), color: randomColor, i : i)
//                    }else{
//                        pieChart(radius: 160, startAngle: start, endAngle: start + CGFloat(2 * Double.pi / totals! * numberArray[i]) , color: randomColor.cgColor)
//                        // 我們使用一個圓 (2 * Double.pi) 來除以合計再乘以目前的數字，產生的結果就是我們目前數字的所佔 total 的比例。
//                        start += CGFloat(2 * Double.pi / totals! * numberArray[i])
//                        // 這邊的 start 必須加上之前的扇形範圍，才是正確的起始點
//                        //showColorPercent(centerX: 30, centerY: 30 * (i + 1), color: randomColor, i : i)
//                        }
//                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    func showColorPercent(centerX x:Int,centerY y:Int,color:UIColor,i:Int) {
        if let total = total{
        var totals = Double(total)
        let colorLabel = UILabel()
        colorLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        colorLabel.center = CGPoint(x: x, y: y)
        colorLabel.backgroundColor = color
        colorLabel.textAlignment = NSTextAlignment.center
            colorLabel.text = "\(Int(numberArray[i] / totals! * 100))%"
        view.addSubview(colorLabel)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        returnButton.layer.cornerRadius = returnButton.frame.size.width / 2
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
extension UIColor{
    open class var randomColor:UIColor{
        get{
            let red = CGFloat(arc4random() % 256) / 255
            let green = CGFloat(arc4random() % 256) / 255
            let blue = CGFloat(arc4random() % 256) / 255
            return UIColor(red: red, green: green, blue: blue, alpha: 1)
        }
    }
}
extension UIScreen {
    enum SizeType: CGFloat {
        case Unknown = 0.0
        case iPhone4 = 960.0
        case iPhone5 = 1136.0
        case iPhone6 = 1334.0
        case iPhone6Plus = 1920.0
    }
    
    var sizeType: SizeType {
        let height = nativeBounds.height
        guard let sizeType = SizeType(rawValue: height) else { return .Unknown }
        return sizeType
    }
}
