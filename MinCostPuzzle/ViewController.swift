//
//  ViewController.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var lowestCostPath: UILabel!
    @IBOutlet weak var lowestCostLbl: UILabel!
    @IBOutlet weak var pathExists: UILabel!
    @IBOutlet weak var inputArea: UITextView!
    var textfield:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputArea.delegate = self;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Sample Sets
    @IBAction func loadSampleSet1(_ sender: Any) {
        inputArea.text = inputCost
    }
    
    @IBAction func loadSampleSet2(_ sender: Any) {
        inputArea.text = inputCost2
    }
    
    @IBAction func loadSampleSet3(_ sender: Any) {
        inputArea.text = inputCost3
    }
    
    // Submit Click Action
    @IBAction func Submit(_ sender: Any) {
        
        resetOutputLabels()
        
        let inputValidationResult = MatrixUtilities.parse(inputString: inputArea.text, delimitedBy: ("\n"," "))
        
        if(!inputValidationResult.success){
            let alert = UIAlertController(title: "Error", message: inputValidationResult.error, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.show(alert, sender: nil)
            return
        }
        
        let matrix = Matrix(inputCostValues: inputValidationResult.costMatrix!)
        let matrixHandler  = MatrixHandler(with: matrix)
        let lowestCost = matrixHandler.getlowestCostPathForMatrix()
        
        lowestCostLbl.text = "Lowest Cost: \(lowestCost.cost)"
        
        if(lowestCost.traveseredTillEnd){
            pathExists.text = "Path Exists : Yes"
        }else{
            pathExists.text = "Path Exists : No"
        }
        
        lowestCostPath.text = "Path : \(lowestCost.route)"
    }
    
    @IBAction func clear(_ sender: Any) {
        inputArea.text = ""
        resetOutputLabels()
    }
    
    // Clear the UI
    func resetOutputLabels(){
        lowestCostLbl.text = "Lowest Cost:"
        pathExists.text = "Path Exists :"
        lowestCostPath.text = "Path :"
    }
    
    //TextView delegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        resetOutputLabels()
    }
    
}

