//
//  ViewController.swift
//  LooperDemo
//
//  Created by Apple on 26/03/21.
//

import UIKit
import VideoPlayerWrapper

class ViewController: UIViewController {
    @IBOutlet weak var mediaLooperView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let url1 = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
        JIOVideoPlayer.shared.loopingMedia(with: url1, inHolder: mediaLooperView)


    }

}

