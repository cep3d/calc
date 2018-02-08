//
//  ViewController.swift
//  calc
//
//  Created by Libero_Imac on 2018/02/08.
//  Copyright © 2018 Libero_Imac. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var c_txt: NSTextField!
    @IBOutlet weak var f_txt: NSTextField!
    @IBOutlet weak var k_txt: NSTextField!
    @IBOutlet weak var result_txt: NSTextField!
    
    @IBOutlet weak var radiogroup: NSMatrix!
    
    @IBOutlet weak var convBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result_txt.stringValue = ""

        // Do any additional setup after loading the view.
    }
    
    @IBAction func convBtnClick(_ sender: NSButton) {
        let r: Int = radiogroup.selectedRow
        switch r {
        case 0:
            self.calcCelsius()
            break
        case 1:
            self.calcFahrenheit()
            break
        case 2:
            self.calcKelvin()
            break
        default:
            self.calcCelsius()
        }
    }
    
    @IBAction func typeChanged(_ sender: NSMatrix) {
        //print(sender.selectedRow)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func calcCelsius() {
        var c: Double?
        if c_txt.stringValue.isEmpty {
            c = 20
        } else {
            c = Double(c_txt.stringValue)
        }

        let a = self.getCelsiusTo(fahrenheit: c!)
        let b = self.getCelsiusTo(kelvin: c!)
        result_txt.stringValue = String(format: "%.2f ℉", a)
        result_txt.stringValue += "\n"
        result_txt.stringValue += String(format: "%.2f K", b)
    }
    
    func calcFahrenheit() {
        var c: Double?
        if f_txt.stringValue.isEmpty {
            c = 68
        } else {
            c = Double(f_txt.stringValue)
        }
        let a = self.getFahrenheitTo(celsius: c!)
        let b = self.getFahrenheitTo(kelvin: c!)
        result_txt.stringValue = String(format: "%.2f ℃", a)
        result_txt.stringValue += "\n"
        result_txt.stringValue += String(format: "%.2f K", b)
    }
    
    func calcKelvin() {
        var c: Double?
        if k_txt.stringValue.isEmpty {
            c = 300
        } else {
            c = Double(k_txt.stringValue)
        }
        let a = self.getKelvinTo(celsius: c!)
        let b = self.getKelvinTo(fahrenheit: c!)
        result_txt.stringValue = String(format: "%.2f ℃", a)
        result_txt.stringValue += "\n"
        result_txt.stringValue += String(format: "%.2f ℉", b)
    }
    
    func getCelsiusTo(fahrenheit: Double) -> Double {
        return fahrenheit * 9 / 5 + 32
    }
    
    func getCelsiusTo(kelvin: Double) -> Double {
        return kelvin + 273.15
    }
    
    func getFahrenheitTo(celsius: Double) -> Double {
        return (celsius - 32) / 1.8
    }
    
    func getFahrenheitTo(kelvin: Double) -> Double {
        return (kelvin - 32) * 5 / 9 + 273.15
    }

    func getKelvinTo(celsius: Double) -> Double {
        return celsius - 273.15
    }
    
    func getKelvinTo(fahrenheit: Double) -> Double {
        return (fahrenheit - 273.15) * 1.8 + 32
    }
}
