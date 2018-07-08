//
//  ViewController.swift
//  Calender
//
//  Created by Simon on 2018/5/21.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import JTAppleCalendar
import CoreData

class ViewController: UIViewController{
    @IBOutlet weak var totalLabel: UILabel!
    var diary = [DiaryUser]()
    
//    @IBAction func isSwitch(_ sender: UISwitch) {
//        if mySwitch.isOn == true{
//            myContainer.isHidden = false
//            calenderView.isHidden = true
//        }else{
//            myContainer.isHidden = true
//            calenderView.isHidden = false
//        }
//    }
//    @IBOutlet weak var mySwitch: UISwitch!
//    @IBOutlet weak var myContainer: UIView!
    
    //判斷滾動時total用
    var scroll:Int64 = 0
    var user = [Users]()
    //var moneys = [Moneny]()
    var use = [Use]()
    var calenderTotal = 0
    let todaysDate = Date()
    let formatter = DateFormatter()
    //過去的月日期
    let outsideMonthColor = UIColor.gray
    //這個月的日期
    let monthColor = UIColor.white
    //選到的日期
    let selectedMonthColor = UIColor.black
    //當前的日期
    let currentDateSelectedViewColor =  UIColor(colorWithHexValue: 0x4e3f5d)
    
    
    @IBOutlet weak var calenderView: JTAppleCalendarView!
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    //返回頁面
    @IBAction func unwind(segue:UIStoryboardSegue){
//        let source = segue.source as? FFTableViewController
//        if let tota = source?.unwindTotal,let user = source?.user,let row = calenderView.indexPathsForSelectedItems?.first?.item{
//        //if let user = source?.moneys,let total = source?.unwindTotal{
//        print(tota)
//            if tota != 0{
//                //做到要把陣列回傳回來
//                self.user = [user]
//                //Use.saveToFile(use: user)
//                calenderTotal = tota
//                calenderView.reloadData()
//                print(calenderTotal)
//                //print("moneys\(self.moneys[0].money)")
//
//            }
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDid\(user.count)")
        calenderView.scrollToDate(Date(), animateScroll:false) //顯示現在的年月
        //calenderView.selectDates([Date() ]) //顯示現在的日
        setupCalenderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(diary.count)
        //讀檔
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let users:NSFetchRequest<DiaryUser> = DiaryUser.fetchRequest()
            let context = appDelegate.persistentContainer.viewContext
            do{
                diary = try context.fetch(users)
                calenderView.reloadData()
            }catch{
            }
        }
    }
    func setupCalenderView(){
        calenderView.minimumLineSpacing = 0       //上下最小間距
        calenderView.minimumInteritemSpacing = 0 //左右最小間距
        calenderView.visibleDates { (visibleDates) in
            self.setupViewsOfCalender(from: visibleDates)
        }
        
    }
    func handleCellTextColor(view: JTAppleCell?, cellState:CellState){
        guard let validCell =  view as? CustomCell else{return}
        //讓你選到的不會反黑
        formatter.dateFormat = "yyyy MM dd"
        //比較時間 今天的選起來 不是今天的設定白色 上個月的設定灰色
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        if todaysDateString == monthDateString{
            validCell.dateLabel.textColor = UIColor.blue
        }else{
            if cellState.dateBelongsTo == .thisMonth{
                validCell.dateLabel.textColor = monthColor
            }else{
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
    //判斷cell有沒有值，有的話反灰  是不是選到的日期，是的會反黃
    func handleCellSelected(view: JTAppleCell?, cellState:CellState){
        guard let validCell =  view as? CustomCell else{return}
        if validCell.isSelected{
            validCell.selectedView.isHidden = false
        }else{
            validCell.selectedView.isHidden = true
        }
    }
    //設定日曆(年月)
    func setupViewsOfCalender(from visibleDates:DateSegmentInfo){
        let date = visibleDates.monthDates.first!.date
        self.formatter.dateFormat = "yyy"
        self.yearLabel.text = self.formatter.string(from: date)
        self.formatter.dateFormat = "MMM"
        self.monthLabel.text = self.formatter.string(from: date)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController:JTAppleCalendarViewDelegate{
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let myCustomCell = cell as! CustomCell
       sharedFunctionToConfigureCell(myCustomCell: myCustomCell, cellState: cellState, date: date)
    }
    func sharedFunctionToConfigureCell(myCustomCell: CustomCell, cellState: CellState, date: Date) {
        myCustomCell.dateLabel.text = cellState.text
        if Calendar.current.isDateInToday(date) {
//            myCustomCell.selectedView.backgroundColor = UIColor.red
//        } else {
//            myCustomCell.selectedView.backgroundColor = UIColor.white
//        }
        }
    }
    
    //點日曆時
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
       //guard let validCell =  calendar as? CustomCell else{return}
        formatter.dateFormat = "yyyy/MM/dd"
        //判斷是新增還是編輯
//        for i in 0..<user.count{
//            if date.compare(user[i].date!) == .orderedSame{
//                if user[i].total != 0{
//                    guard let controllet = storyboard?.instantiateViewController(withIdentifier: "aa") as? UpdatedTableViewController else{return}
//                    //把我點選的日期傳出去
//                    controllet.date = formatter.string(from: date)
//                    controllet.user = user[i]
//                    cell?.bounce()
//                    handleCellTextColor(view: cell, cellState: cellState)
//                    handleCellSelected(view: cell, cellState: cellState)
//                    present(controllet, animated: true, completion: nil)
//                    break
//                }
//            }
//        }
        
        for i in 0..<diary.count{
            if date.compare(diary[i].date!) == .orderedSame{
                if diary[i].diary != ""{
                    guard let controller = storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController else{fatalError()}
                  controller.date = formatter.string(from: date)
                    controller.diary = diary[i]
                    cell?.bounce()
                    handleCellTextColor(view: cell, cellState: cellState)
                    handleCellSelected(view: cell, cellState: cellState)
                    present(controller, animated: true, completion: nil)
                    break
                }
            }
        }
       
//        guard let controllet = storyboard?.instantiateViewController(withIdentifier: "bb") as? FFTableViewController else{return}
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "addDiary") as? AddDiaryViewController else{fatalError()}
        //把我點選的日期傳出去
        controller.date = formatter.string(from: date)
        present(controller, animated: true, completion: nil)
        cell?.bounce()
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
    }
    //取消點日曆時
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        //guard let validCell =  calendar as? CustomCell else{return}
//        validCell.selectedView.isHidden = true
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
    }
//    //視圖是否滾動
//    func calendarDidScroll(_ calendar: JTAppleCalendarView) {
//        totalLabel.text = "\(0)"
//        calenderView.reloadData()
//    }
    //設定cell內容
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        guard let cell = calendar.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else{
            fatalError()
        }
//        for i in 0..<user.count{
//            if date.compare(user[i].date!) == .orderedAscending{
//                let total = user.filter {$0.date! > date}
//                scroll = total.reduce(0){$0 + $1.total}
//                totalLabel.text = "\(scroll)"
//               // print(total)
//                break
//            }
//            else if cellState.date.compare(user[i].date!) == .orderedDescending{
//                let total = user.filter {$0.date! > cellState.date}
//                scroll = total.reduce(0){$0 + $1.total}
//                totalLabel.text = "\(scroll)"
//                print(total)
//                //break
//            }else if cellState.date.compare(user[i].date!) == .orderedSame{
//                let total = user.filter {$0.date! == cellState.date}
//                scroll = total.reduce(0){$0 + $1.total}
//                totalLabel.text = "\(scroll)"
//                print(total)
//                //break
//            }
//        }
        cell.totalView.isHidden = true
            for i in 0..<diary.count{
                if date.compare(diary[i].date!) == .orderedSame{
                    if diary[i].diary != ""{
                        cell.totalView.isHidden = false
                        break
                    }
                }
            }
        
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
        sharedFunctionToConfigureCell(myCustomCell: cell, cellState: cellState, date: date)
        return cell
    }
    
    
    //這裡
    //設定日曆 滾動日曆
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
//        setupViewsOfCalender(from: visibleDates)
//        var sum:Int64 = 0
//       for i in 0..<user.count{
//            let calendar = Calendar.current
//            let components = calendar.dateComponents([.year, .month], from: user[i].date!)
//         if components.year == 2018 && components.month == 5{
//            sum += user[i].total
//            totalLabel.text = String(sum)
//            self.reloadInputViews()
//            //break
//         }
//        if components.year == 2018 && components.month == 6{
//            sum += user[i].total
//            totalLabel.text = String(sum)
//            self.reloadInputViews()
//            //break
//        }
//            print(components.year, components.month,components.day,components.date)
//           }
//        let date = visibleDates.outdates.first?.date
//        let components = Calendar.current.dateComponents(in: TimeZone(abbreviation: "GMT")!, from: date!)
//        print(components.year, components.month)
//        for i in 0..<user.count{
//                 if components.year == 2018 && components.month == 5{
//                    sum = 0
//                    sum += user[i].total
//                    totalLabel.text = String(sum)
//                    self.reloadInputViews()
//                    //break
//                 }
//                if components.year == 2018 && components.month == 6{
//                    sum = 0
//                    sum += user[i].total
//                    totalLabel.text = String(sum)
//                    self.reloadInputViews()
//                    //break
//                }
//        }
//
        setupViewsOfCalender(from: visibleDates)
        }
    }

//設定日曆範圍
extension ViewController:JTAppleCalendarViewDataSource{
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale

        let startDate = formatter.date(from: "2000 01 01")!
        let endDate = formatter.date(from: "2100 12 31")!

        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
}
//讓顏色可以16進位
extension UIColor{
    convenience init(colorWithHexValue value:Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0xFF0000) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha:alpha
        )
    }
}
extension UIView{
    func bounce(){
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}


