//
//  MultipleMediaFilePlayer.swift
//  LooperDemo
//
//  Created by Apple on 26/03/21.
//

import UIKit
import VideoPlayerWrapper

class MultipleMediaFilePlayer: UIViewController {
    @IBOutlet weak var mediaLooperView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url1 = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
        let url2 = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4")!
        let url3 = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8")!

        JIOVideoPlayer.shared.playingMedia(with: [url1,url2,url3], inHolder: mediaLooperView)


    }


}
