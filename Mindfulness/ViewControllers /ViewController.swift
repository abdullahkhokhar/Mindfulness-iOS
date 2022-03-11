//
//  ViewController.swift
//  Mindfulness
//
//  Created by Abdullah Khokhar & Rahul Jasani on 2022-02-14.
//

import UIKit
import Firebase
import iCarousel

class ViewController: UIViewController, iCarouselDataSource {
    
    
    var titleOfPage = ""
    var labelOfTitle = ""
    var categoryChosen = "situations"
    var labelsForSituations:[String] = ["Commute", "Busy Day"]
    @IBOutlet weak var midView: UIStackView!
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        view.bounces = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        midView.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 35, width: view.frame.size.width, height: 400)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
       return 2
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 400))
         //to this view can add the image and the label
        
        let button = UIButton(frame: view.bounds)
        button.setImage(UIImage(named: "pic\(index)"), for: .normal)
        button.addTarget(self , action: #selector(buttonNextAction(sender:)), for: .touchUpInside)
        button.accessibilityLabel = labelsForSituations[index]
        view.addSubview(button)
        
        //label view
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 21))
        label.font = UIFont(name: "Avenir", size: 17)
        label.center = CGPoint(x: 44, y: 420)
        label.textAlignment = .center
        label.text = labelsForSituations[index]

        view.addSubview(label)
        
        return view
    }
    
    
    @objc func buttonNextAction(sender: UIButton) {
        if (categoryChosen == "situations") {
            switch sender.accessibilityLabel {
                case labelsForSituations[0]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Take some time out during your \r\ncommute for yourself"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                case labelsForSituations[1]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Start your day by taking time \r\nout for yourself"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                default:
                    break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CommutingViewController
        vc.title1 = self.titleOfPage
        vc.labelForTitle = self.labelOfTitle
        
    }
    
    @IBOutlet weak var situationsButton: UIButton!
    @IBOutlet weak var environmentsButton: UIButton!
    @IBOutlet weak var dailyButton: UIButton!
    
    @IBAction func situationsButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "selected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "environment-1.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "daily=1.png"), for: .normal)
        categoryChosen = "situations"
    }
    
    @IBAction func environmentsButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "unselected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "selected-environment.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "daily=1.png"), for: .normal)
        categoryChosen = "environment"
    }
    
    @IBAction func dailyButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "unselected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "environment-1.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "selected-daily.png"), for: .normal)
        categoryChosen = "daily"
    }
}

