//
//  phoneViewController.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/9/17.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit
import AgoraRtcKit
//import AgoraRtcEngineKit
class phoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAgoraEngine()     // Tutorial Step 1
        joinChannel()               // Tutorial Step 3
        setupButtons()              // Tutorial Step 11

        // Do any additional setup after loading the view.
    }
    var isStartCalling = false
    var agoraKit: AgoraRtcEngineKit!
    let AppID = "d7bcc8c4b2c149faa3d07784740aedc7"
    var channel:String?
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AppID, delegate: self as! AgoraRtcEngineDelegate)
    }

    
    
    // Tutorial Step 3
    func joinChannel() {
        agoraKit.joinChannel(byToken: nil, channelId: channel!, info:nil, uid:0) {[weak self] (sid, uid, elapsed) -> Void in
            if let weakSelf = self {
                weakSelf.agoraKit.setEnableSpeakerphone(true)
                UIApplication.shared.isIdleTimerDisabled = true
            }
        }
    }
    
    
    @IBAction func muteAction(_ sender: Any) {
        //(sender as AnyObject).isSelected = !(sender as AnyObject).isSelected
        agoraKit.muteLocalAudioStream((sender as AnyObject).isSelected)
       // resetHideButtonsTimer()
    }
    @IBAction func exitAction(_ sender: Any) {
        leaveChannel()
    }
    @IBAction func strengthAction(_ sender: Any) {
    }
    
    // Tutorial Step 6
    func leaveChannel() {
        agoraKit.leaveChannel(nil)
        hideControlButtons()
        UIApplication.shared.isIdleTimerDisabled = false
        agoraKit = nil
    }
    
    @IBOutlet weak var controlButtons: UIButton!
    // Tutorial Step 6
    @objc func hideControlButtons() {
        controlButtons.isHidden = true
    }
    
    /*func resetHideButtonsTimer() {
        VideoCallViewController.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(hideControlButtons), with:nil, afterDelay:3)
    }
    func hideVideoMuted() {
            remoteVideoMutedIndicator.isHidden = true
            localVideoMutedBg.isHidden = true
            localVideoMutedIndicator.isHidden = true
        }*/
        
    // Tutorial Step 11
    func setupButtons() {
        perform(#selector(hideControlButtons), with:nil, afterDelay:3)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(phoneViewController.viewTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
        
        
    // Tutorial Step 11
    @objc func viewTapped() {
        if (controlButtons.isHidden) {
            controlButtons.isHidden = false;
            perform(#selector(hideControlButtons), with:nil, afterDelay:3)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
