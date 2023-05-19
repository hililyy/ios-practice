//
//  CameraViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/18.
//

import UIKit
import AVFoundation
import CropViewController

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
        guard let img = UIImage(data: imageData) else { return }
        // 이미지뷰에 이미지 설정
        showCrop(image: img)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        photoOutput?.capturePhoto(with: AVCapturePhotoSettings(), delegate: self as AVCapturePhotoCaptureDelegate)
    }
    
    @IBAction func goAlbum(_ sender: UIButton) {
        didTapButton()
    }
}
extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
    @objc func didTapButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        picker.dismiss(animated: true)
        showCrop(image: image)
    }
    
    func showCrop(image: UIImage) {
        let vc = CropViewController(croppingStyle: .default, image: image)
        
        vc.aspectRatioPreset = .presetSquare
        vc.aspectRatioLockEnabled = false
        vc.toolbarPosition = .bottom
        vc.doneButtonTitle = "Continue"
        vc.cancelButtonTitle = "Quit"
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
        cropViewController.dismiss(animated: true)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true)
        print("didCrop")
        // 여기서 서버 요청
        let imageView = UIImageView(frame: view.frame)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        view.addSubview(imageView)
    }
}
