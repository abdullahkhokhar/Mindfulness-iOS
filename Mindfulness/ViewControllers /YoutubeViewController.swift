//
//  YoutubeViewController.swift
//  Mindfulness
//
//  Created by Rahul Jasani on 2022-03-02.
//

import youtube_ios_player_helper
import UIKit

class YoutubeViewController: UIViewController {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    var finalVideoIdOfVideo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: finalVideoIdOfVideo)
    }
}
