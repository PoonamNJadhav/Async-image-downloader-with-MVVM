//
//  VideoCustomCell.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import UIKit

class VideoCustomCell:  UICollectionViewCell {
    @IBOutlet weak fileprivate var thumbnail :AsyncImageView!
    @IBOutlet weak fileprivate var dateLabel :UILabel!
    @IBOutlet weak fileprivate var timeLabel :UILabel!
    @IBOutlet weak fileprivate var status :AsyncImageView!
    @IBOutlet weak fileprivate var sizeLabel :UILabel!
    @IBOutlet weak var thumnailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumnailWeightConstraint: NSLayoutConstraint!
    
    var videoViewModel: VideoViewModel! {
        didSet {
            if let url =  videoViewModel.thumbnailURL {
                thumbnail.setImageURL(url)
            }
            dateLabel.text = videoViewModel.createdDate
            timeLabel.text = "@ " + (videoViewModel.createdTime ?? "")
            sizeLabel.text = videoViewModel.fileSize
              if let stausURL =  videoViewModel.status?.getVideoStatusURL(){
            status.setImageURL( stausURL)
            }
        }
        
    }
    override func awakeFromNib() {
        thumnailWeightConstraint.constant = (UIScreen.main.bounds.size.width-52)/2
     
    }
    override func prepareForReuse() {
        super.prepareForReuse()
         self.thumbnail.image = nil
         self.status.image = nil
         self.dateLabel.text = ""
         self.timeLabel.text = ""
         self.sizeLabel.text = ""
        
    }
}

