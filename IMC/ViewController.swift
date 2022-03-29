//
//  ViewController.swift
//  IMC
//
//  Created by Apple on 10/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHight: UITextField!
    @IBOutlet weak var LbResult: UILabel!
    @IBOutlet weak var ivresults: UIImageView!
    @IBOutlet weak var viResult: UIView!

    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Calculate(_ sender: Any){
        if let weight = Double(tfWeight.text!), let height = Double(tfHight.text!){
            imc = weight / (height*height)
            showResults()
        }
    }
        
    func touchesBegan(_touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    func showResults () {
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "peso ideal"
                image = "ideal"
            case 25..<30:
                result = "sobrepeso"
                image = "sobre"
            default:
                result = "obesidade"
                image = "obesidade"
        }
        
        LbResult.text = "\(Int(imc)): \(result)"
        ivresults.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
        }
}
    
