//
//  GPVideoPlayer.swift
//  GPVideoPlayer
//
//  Created by Apple on 26/03/21.
//


import Foundation
import AVFoundation
import UIKit

//MARK:This class provide interface to initiate the required AV classes like AVPlayer , AVLooper AVQueuePlayer.

public class JIOVideoPlayer: NSObject {
    var mediaPlayer: AVPlayer?
    var playerItem: AVPlayerItem?
    var playerLooper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer?
    var playerLayer: AVPlayerLayer?

    public static let shared = JIOVideoPlayer()
    
    override init(){}

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    public func loopingMedia(with url: URL, inHolder: UIView) {
       
        queuePlayer = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: queuePlayer)
        playerItem = AVPlayerItem(url: url)
        guard let player = queuePlayer,let pLayer = playerLayer, let item = playerItem else { return }
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        pLayer.videoGravity = .resizeAspectFill
        pLayer.frame = inHolder.bounds
        inHolder.layer.addSublayer(pLayer)
        
        queuePlayer?.play()
        
    }

    public func playingMedia(with urls: [URL], inHolder: UIView) {
       
        guard !urls.isEmpty else {
            print("🚫 URLs not available.")
            return
        }
        
        guard let player = self.player(with: urls) else {
            print("🚫 AVPlayer not created.")
            return
        }
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = inHolder.bounds

        playerLayer.videoGravity = .resizeAspectFill
        inHolder.layer.insertSublayer(playerLayer, at: 0)
        player.play()
    }
    
    func player(with urls: [URL]) -> AVQueuePlayer? {
        var playerItems = [AVPlayerItem]()
        
        urls.forEach { (url) in
            let asset = AVAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            playerItems.append(playerItem)
        }
        
        guard !playerItems.isEmpty else {
            return nil
        }
        let player = AVQueuePlayer(items: playerItems)
        self.queuePlayer? = player
        return player

    }
    
}
