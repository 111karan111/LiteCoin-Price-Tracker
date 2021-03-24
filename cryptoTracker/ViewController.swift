//
//  ViewController.swift
//  cryptoTracker
//
//  Created by Karan Gandhi on 3/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    var url = "https://min-api.cryptocompare.com/data/price?fsym=ltc&tsyms=USD"
    
    
    func getData(){
        
        
        //initialize url
        
        
        guard let url = URL(string: url) else { return }
        
        //Create a dataTask and initiate a URL Session
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            
            guard let data = data, error == nil else {return}
            
            print("Data Received!")
            
            
            //Unfold Data
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                
                print(result.USD)
                
                DispatchQueue.main.async {
                    self.outputLabel.text = "\(result.USD)"
                  
                    
                }
              
                
            }
            
            
            catch {
                
                print(error.localizedDescription)
                
            }
            
            
            
            
            
        }
        

        
        //Task Resume
        
        task.resume()
        
        
        
        
        
        
        
        
        
    }

    struct APIResponse : Codable {
        
        let USD : Float
        
        
        
    }

    @IBAction func output(_ sender: Any) {
        
        getData()
        
        
        
    }
}

