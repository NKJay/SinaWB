//
//  QRCodeViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/28.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {
    @IBOutlet weak var scanlineView: UIImageView!
    @IBOutlet weak var scanlineHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scanlineTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBAction func leftButtonDidClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func rightButtonDidClick(sender: AnyObject) {
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        scanlineAnimation()
    }
    
    private func scanlineAnimation() {
        
//        scanlineTopConstraint.constant = -scanlineHeightConstraint.constant
//        
//        scanlineView.layoutIfNeeded()
        
        print(scanlineTopConstraint.constant)
        UIView.animateWithDuration(2.0) {
            
            self.scanlineTopConstraint.constant = self.scanlineHeightConstraint.constant
            
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanlineView.layoutIfNeeded()
        }
    }
    
    private lazy var session:AVCaptureSession = AVCaptureSession()
    
    private lazy var deviceInput:AVCaptureDeviceInput? = {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        do {
        let input = try AVCaptureDeviceInput(device: device)
        return input
        } catch {
            print(error)
            return nil
        }
    }()
    
    private lazy var output:AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    func startScan() {
        if !session.canAddInput(deviceInput){
            return
        }
        
        if !session.canAddOutput(output) {
            return
        }
        
        session.addOutput(output)
        session.addInput(deviceInput)
        
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        view.layer.addSublayer(previewLayer)
        view.layer.insertSublayer(previewLayer, atIndex: 0)
        
        session.startRunning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.selectedItem = tabBar.items![0]
        startScan()
    }
    
    private lazy var previewLayer:AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer.frame = UIScreen.mainScreen().bounds
        return layer
    }()

}

extension QRCodeViewController:AVCaptureMetadataOutputObjectsDelegate {
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        print(metadataObjects.last?.stringValue)
    }
}
