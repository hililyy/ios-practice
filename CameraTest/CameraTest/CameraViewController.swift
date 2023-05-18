//
//  CameraViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/18.
//

import UIKit
import AVFoundation
class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate{
    
    @IBOutlet weak var previewView: UIView!
    
    var captureSession: AVCaptureSession!
    var photoOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession = AVCaptureSession()
        captureSession.beginConfiguration()

        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }

        do {
            let cameraInput = try AVCaptureDeviceInput(device: captureDevice)
            
            photoOutput = AVCapturePhotoOutput()
            
            captureSession.addInput(cameraInput)
            captureSession.sessionPreset = .photo
            captureSession.addOutput(photoOutput)
            captureSession.commitConfiguration()
        } catch {
            print(error)
        }

        //preview
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        DispatchQueue.main.async {
            self.videoPreviewLayer.frame = self.previewView.bounds
        }
        videoPreviewLayer?.videoGravity = .resizeAspectFill
        self.previewView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global().async {
            self.captureSession.startRunning()
        }
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: imageData)
        // 이미지뷰에 이미지 설정
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        vc.myImage = image
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        photoOutput?.capturePhoto(with: AVCapturePhotoSettings(), delegate: self as AVCapturePhotoCaptureDelegate)
    }
}
