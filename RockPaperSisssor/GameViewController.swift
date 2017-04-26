//
//  GameViewController.swift
//  RockPaperSisssor
//
//  Created by yeswanth varma on 1/20/17.
//  Copyright © 2017 yeswanth varma. All rights reserved.
//

import UIKit

enum HandShape {
    case Rock
    case Paper
    case Scissors
}

enum MatchResult:String{
    case win
    case draw
    case lose
}

class GameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var PlayerTwoImage: UIImageView!

    @IBOutlet weak var PlayerOneImage: UIImageView!
    @IBOutlet weak var playButtton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var ImageOnePicked = false
    var ImageTwoPicked = false
    
   
    
    let pickerData = ["Rock", "Paper", "Scissors"]
    
    
    
    
   

    
    var PlayeOneSelection:HandShape!
    var PlayerTwoSelection:HandShape!
    var PlayerOneresult:MatchResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.isHidden = true
        
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageOneTapped(img:)))
           let tapGestureRecognizerTwo = UITapGestureRecognizer(target:self, action:#selector(imageTwoTapped(img:)))
        PlayerOneImage.isUserInteractionEnabled = true
        PlayerOneImage.addGestureRecognizer(tapGestureRecognizer)
        PlayerTwoImage.isUserInteractionEnabled = true
        PlayerTwoImage.addGestureRecognizer(tapGestureRecognizerTwo)
        Result.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    
    func match(_ first: HandShape, _ second: HandShape) -> MatchResult {
        if first == second {
            return .draw
        }
        
        if first == .Rock && second == .Scissors {
            return .win
        }
        
        if first == .Paper && second == .Rock {
            return .win
        }
        
        if first == .Scissors && second == .Paper {
            return .win
        }
        
        return .lose
    }

    
    
    func imageOneTapped(img: AnyObject)
    {
        ImageOnePicked = true
        ImageTwoPicked = false
        pickerView.isHidden = false
        // Your action
    }
    
    func imageTwoTapped(img: AnyObject)
    {
        
        ImageTwoPicked = true
        ImageOnePicked = false
        
        pickerView.isHidden = false
        // Your action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        Result.isHidden = true
        
        if ImageOnePicked {
        PlayerOneImage.image = UIImage(named: "\(pickerData[row])")
            switch row {
            case 0:
                PlayeOneSelection = HandShape.Rock
            case 1:
                PlayeOneSelection = HandShape.Paper
            case 2:
                PlayeOneSelection = HandShape.Scissors
            default:
                 PlayeOneSelection = HandShape.Rock
            }
        }else {
        PlayerTwoImage.image = UIImage(named: "\(pickerData[row])")
            switch row {
            case 0:
                PlayerTwoSelection = HandShape.Rock
            case 1:
                PlayerTwoSelection = HandShape.Paper
            case 2:
                PlayerTwoSelection = HandShape.Scissors
            default:
                PlayerTwoSelection = HandShape.Rock
            }
        }
        
    pickerView.isHidden = true
        
    }
    
    func donePicker() {
        
        
        
    }
    

    @IBAction func RunGame(_ sender: Any) {
      
        
        
        self.PlayerOneresult = match(PlayeOneSelection, PlayerTwoSelection)
        
    
        
        
        
        Result.text = "Player One \(PlayerOneresult.rawValue)!!"
        
         Result.isHidden = false
        
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
