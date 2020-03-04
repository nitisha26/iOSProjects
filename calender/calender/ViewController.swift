//
//  ViewController.swift
//  calender
//
//  Created by Nitisha on 2020-03-03.
//  Copyright © 2020 english. All rights reserved.
//

import UIKit
import FSCalendar


class ViewController: UIViewController {
    fileprivate weak var calendar : FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()

        let calendar = FSCalendar(frame: CGRect( x: 0, y: 0, width: 32,
                                                 height: 300))
    calendar.dataSource = self
    calendar.delegate = self
    calendar.register(FSCalendarCell.self , forCellReuseIdentifier: "CELL")
    calendar.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(calendar)
    self.calendar = calendar
       
        
        calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendar.heightAnchor.constraint(equalToConstant:  300).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 10).isActive = true
        
      
    }


}

extension ViewController : FSCalendarDataSource , FSCalendarDelegate{
    
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        return "maxcodes.io"
//    }
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return "subscribe"
//    }
    
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        return UIImage(named: "cal")
    }
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "CELL", for: date, at: position)
        cell.imageView.contentMode = .scaleAspectFit
        return cell
    }
}

