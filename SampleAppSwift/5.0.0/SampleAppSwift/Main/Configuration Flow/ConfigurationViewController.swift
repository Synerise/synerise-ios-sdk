//
//  ConfigurationViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import AVFoundation

class ConfigurationViewController: DefaultViewController {
    
    var viewModel: ConfigurationViewModel!
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.qr]
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var syneriseBaseURLTextField: BindingTextField!
    @IBOutlet weak var clientAPIKeyTextField: BindingTextField!
    
    // MARK: - Deinit
    
    deinit {
        stopObserving()
    }
    
    // MARK: - IBAction
    
    @IBAction func syneriseBaseURLSheet(sender: AnyObject) {
        let syneriseBaseURLSheet = UIAlertController(title: nil, message: "Choose predefined Synerise Base URL", preferredStyle: .actionSheet)

        let action1 = UIAlertAction(title: "https://api.snrapi.com", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.syneriseBaseURLTextField.text = "https://api.snrapi.com"
        })
        
        let action2 = UIAlertAction(title: "https://api.geb.snrapi.com", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.syneriseBaseURLTextField.text = "https://api.geb.snrapi.com"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in

        })
        
        syneriseBaseURLSheet.addAction(action1)
        syneriseBaseURLSheet.addAction(action2)
        syneriseBaseURLSheet.addAction(cancelAction)
        
        if let popoverPresentationController = syneriseBaseURLSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.syneriseBaseURLTextField
            popoverPresentationController.sourceRect = sender.bounds
        }
        
        self.present(syneriseBaseURLSheet, animated: true, completion: nil)
    }
    
    @IBAction func finishButtonWasPressed() {
        if viewModel.isFormValid() {
            viewModel.saveSyneriseBaseUrlAndAPIKey()
            viewModel.saveDefaultSettings()
            viewModel.onFinishButton?()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindTextFields()
        startObserving()
        
        syneriseBaseURLTextField.text = "https://api.snrapi.com"
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            
        } catch let error {
            DebugUtils.print("AVCaptureDeviceInput error: \(error.localizedDescription)")
        }
        
        prepareVideoPreview()
    }
    
    override func viewDidLayoutSubviews() {
        videoPreviewLayer?.frame = cameraView.layer.bounds
    }
    
    private func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // swiftlint:disable notification_center_detachment
    private func stopObserving() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Inherited
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            viewModel.clientAPIKey.value = Configuration.SyneriseSDK.clientAPIKey1
        }
    }
    
    // MARK: - Private
    
    private func prepareVideoPreview() {
        captureSession.startRunning()
        initializeVideoPreview()
        hightlightQRCode()
        self.hideKeyboardWhenTappedAround()
    }
    
    private func initializeVideoPreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resize
        
        cameraView.layer.addSublayer(videoPreviewLayer!)
    }
    
    private func hightlightQRCode() {
        qrCodeFrameView = UIView()
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            qrCodeFrameView.layer.borderWidth = 2
            cameraView.addSubview(qrCodeFrameView)
            cameraView.bringSubviewToFront(qrCodeFrameView)
        }
    }
    
    private func bindTextFields() {
        syneriseBaseURLTextField.text = viewModel.syneriseBaseURL.value
        syneriseBaseURLTextField.bind(to: viewModel.syneriseBaseURL)
        
        clientAPIKeyTextField.text = viewModel.clientAPIKey.value
        clientAPIKeyTextField.bind(to: viewModel.clientAPIKey)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        let keyboardHeight = keyboardFrame.height
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension ConfigurationViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            
            return
        }
        
        guard let metadataObject = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else { return }
        
        if supportedCodeTypes.contains(metadataObject.type) {
            guard let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObject) else { return }
            qrCodeFrameView?.frame = barCodeObject.bounds
            
            if metadataObject.stringValue != nil {
                self.clientAPIKeyTextField.text = metadataObject.stringValue
            }
        }
    }
}
