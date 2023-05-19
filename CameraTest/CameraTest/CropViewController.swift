//
//  CropViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/19.
//

import UIKit

//class CropViewController: UIViewController {
//    var cropwillImage: UIImage?
//
//    @IBOutlet weak var scrollView: UIScrollView! {
//        didSet {
//            scrollView.minimumZoomScale = 1
//            scrollView.maximumZoomScale = 2
//            scrollView.delegate = self
//        }
//    }
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var view_crop_line: UIView!
//
//    @IBOutlet weak var view_crop: UIView!
//
//    @IBAction func button_crop_clicked(_ sender: Any) {
//        guard let imageToCrop = imageView.image else { return }
//
//        let cropRect = CGRect(x: view_crop.frame.origin.x - imageView.realImageRect().origin.x,
//                              y: view_crop.frame.origin.y - imageView.realImageRect().origin.y,
//                              width: view_crop.frame.width,
//                              height: view_crop.frame.height)
//
//        let croppedImage = ImageCropHandler.sharedInstance.cropImage(imageToCrop,
//                                                                     toRect: cropRect,
//                                                                     imageViewWidth: imageView.frame.width,
//                                                                     imageViewHeight: imageView.frame.height)
//
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CropResultViewController") as? CropResultViewController else { return }
//        vc.img = croppedImage
//        vc.modalPresentationStyle = .formSheet
//        self.present(vc, animated: true)
////        imageView.image = croppedImage
////        scrollView.zoomScale = 1
//    }
//
//    override func viewDidLoad() {
//        imageView.image = cropwillImage
//        view_crop_line.layer.cornerRadius = 5
//        view_crop_line.layer.borderWidth = 3
//        view_crop_line.layer.borderColor = UIColor.black.cgColor
//        view_crop_line.isUserInteractionEnabled = false
//    }
//}

//extension CropViewController: UIScrollViewDelegate {
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return imageView
//    }
//}
