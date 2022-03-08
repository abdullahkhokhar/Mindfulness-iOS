//
//  CommutingViewController.swift
//  Mindfulness
//
//  Created by Rahul Jasani on 2022-03-04.
//
import UIKit
import Firebase

class CommutingViewController: UIViewController {

    var videoIdOfVideo = ""
    
    @IBOutlet weak var video1: UIButton!
    @IBOutlet weak var video2: UIButton!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func video1Pressed(_ sender: Any)
    {
        let docRef = db.collection("situations").document("Busy Day")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.get("video1") ?? "nil"
                print(dataDescription)
                self.videoIdOfVideo = dataDescription as! String
                print("pressed 1")
                print(" 1 " + self.videoIdOfVideo)
                self.performSegue(withIdentifier: "youtubeIdentifier", sender: self)
                print("self " + self.videoIdOfVideo)
            } else {
                print("Document does not exist")
            }
        }
        
        
        //retrieveUrl("video1")
//        print("pressed 1")
//        print(" 1 " + self.videoIdOfVideo)
//        performSegue(withIdentifier: "youtubeIdentifier", sender: self)
    }
    
    @IBAction func video2Pressed(_ sender: Any)
    {
        let docRef =  db.collection("situations").document("Busy Day")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.get("video2") ?? "nil"
                print(dataDescription)
                self.videoIdOfVideo = dataDescription as! String
                self.performSegue(withIdentifier: "youtubeIdentifier", sender: self)
                print("pressed 2")
                print("self " + self.videoIdOfVideo)
            } else {
                print("Document does not exist")
            }
        }
        
        //retrieveUrl("video2")
//        performSegue(withIdentifier: "youtubeIdentifier", sender: self)
//        print("pressed 2")
    }
    
//    func retrieveUrl(_ address:String) {
//        let docRef =  db.collection("situations").document("Busy Day")
//        sleep(5)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.get(address) ?? "nil"
//                self.videoIdOfVideo = dataDescription as! String
//                print("self " + self.videoIdOfVideo)
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(self.videoIdOfVideo)
        let vc = segue.destination as! YoutubeViewController
        vc.finalVideoIdOfVideo = self.videoIdOfVideo
    }
}
