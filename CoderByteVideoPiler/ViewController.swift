//
//  ViewController.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var videoVModelList :[VideoViewModel] = []
   @IBOutlet weak var collectionView : UICollectionView?
    var currentPage = 0
    var pageLimit = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchData()
        
    }

    func fetchData() {
        ClientService.shared.fetchVideoFiles(offSet:(currentPage*6),completion: {[weak self] (result) in
                switch result{
                case .success(let data):
                    if let dataToParse = data {
                        let videoes = JSONHelper.shareInstance.parseJsonData(jsonData: dataToParse)
                        self?.videoVModelList +=
                        videoes.map({return VideoViewModel($0)})
                        print("List")
                        DispatchQueue.main.async {
                        self?.collectionView?.reloadData()
                        }
                    }
                case .error(let error):
                    print(error.debugDescription)
                }
            })
        }
       
    func loadNextPage(){
        currentPage += 1
        fetchData()
    }
}


//MARK - Delegate and datasource methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoVModelList.count
      }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell:VideoCustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCustomCell", for: indexPath) as! VideoCustomCell
          let model = videoVModelList[indexPath.row]
          cell.videoViewModel = model
       
          return cell
          
      }
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //Loading next page here we can add on scroll event also..
          if (indexPath.row == ((currentPage+1)*pageLimit - 1 ) ) { //it's your last cell
            //Load more data & reload your collection view
            self.loadNextPage()
          }
     }
    
}
extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if !videoVModelList.isEmpty {
      // return CGSize(width: (UIScreen.main.bounds.size.width-10)/2, height: (UIScreen.main.bounds.size.height-45)/3)
            return CGSize(width: (UIScreen.main.bounds.size.width-10)/2, height: 200.0)
                          }
                     return CGSize.zero
    }
}
