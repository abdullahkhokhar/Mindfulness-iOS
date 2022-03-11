//
//  ViewController.swift
//  Mindfulness
//
//  Created by Abdullah Khokhar on 2022-02-14.
//

import UIKit
import iCarousel

class ViewController: UIViewController, iCarouselDataSource {
    
    
    var titleOfPage = ""
    var labelOfTitle = ""
    var labels:[String] = ["Commute", "Busy Day"]
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
    
//    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 400))
//
//        // to this view can add the image and the label
//        let imageView = UIImageView(frame: view.bounds)
//        imageView.layer.cornerRadius = 10
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "pic\(index)")
//
//        view.addSubview(imageView)
//
//        // label view
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 21))
//        label.font = UIFont(name: "Avenir", size: 17)
//        label.center = CGPoint(x: 44, y: 420)
//        label.textAlignment = .center
//        label.text = labels[index]
//
//        view.addSubview(label)
//
//        return view
//    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 400))
         //to this view can add the image and the label
        
        let button = UIButton(frame: view.bounds)
        button.setImage(UIImage(named: "pic\(index)"), for: .normal)
        button.addTarget(self , action: #selector(buttonNextAction(sender:)), for: .touchUpInside)
        button.accessibilityLabel = labels[index]
        view.addSubview(button)
        
        //label view
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 21))
        label.font = UIFont(name: "Avenir", size: 17)
        label.center = CGPoint(x: 44, y: 420)
        label.textAlignment = .center
        label.text = labels[index]

        view.addSubview(label)
        
        return view
    }
    
    
    @objc func buttonNextAction(sender: UIButton) {
        switch sender.accessibilityLabel {
        case "Commute":
            self.titleOfPage = sender.accessibilityLabel!
            self.labelOfTitle = "Take some time out during your \r\ncommute for yourself"
            self.performSegue(withIdentifier: "pageIdentifier", sender: self)
            break
        case "Busy Day":
            self.titleOfPage = sender.accessibilityLabel!
            self.labelOfTitle = "Start your day by taking time \r\nout for yourself"
            self.performSegue(withIdentifier: "pageIdentifier", sender: self)
            break
        default:
            break
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
    }
    
    @IBAction func environmentsButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "unselected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "selected-environment.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "daily=1.png"), for: .normal)
    }
    
    @IBAction func dailyButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "unselected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "environment-1.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "selected-daily.png"), for: .normal)
    }
}

