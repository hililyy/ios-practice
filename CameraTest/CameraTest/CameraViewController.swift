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
        self.navigationController?.isNavigationBarHidden = true
        
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

    @IBAction func takePhoto(_ sender: Any) {
        photoOutput?.capturePhoto(with: AVCapturePhotoSettings(), delegate: self as AVCapturePhotoCaptureDelegate)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        guard let img = UIImage(data: imageData) else { return }
        // 이미지뷰에 이미지 설정
        showEditImage(img)
    }
    
    private func showEditImage(_ image: UIImage) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CropViewController") as! CropViewController
        vc.modalPresentationStyle = .fullScreen
        vc.image = image
        self.present(vc, animated: true)
    }
}
