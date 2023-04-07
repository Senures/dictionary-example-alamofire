//
//  ViewController.swift
//  turkishDictionary
//
//  Created by SEMANUR ESERLER on 29.03.2023.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    
    
    @IBOutlet weak var dTableView: UITableView!
    var search:String=""
    
    var anlamlarListe : [AnlamlarListe]?
    
    @IBOutlet weak var searchTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dTableView.delegate =  self
        dTableView.dataSource = self
      
        
        searchTextfield.delegate = self
        
        searchTextfield.resignFirstResponder()
        // Do any additional setup after loading the view.
        
        
    }
    
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.dTableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     
        textField.resignFirstResponder()
        search(text: textField.text)
  
        return true
    }
    
    func search(text: String?) {
      
        if let deneme = text {
            
            self.search = deneme
            print(self.search)
            let searchText = self.search
          
            ApiClient.apiClient.fetchDictionaryElement(params:search) { response in
                self.anlamlarListe = response[0].anlamlarListe
                self.dTableView.reloadData()
                
            }
            
        }
        
        
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anlamlarListe?.count ?? 0
        // return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DictionaryCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height/15
        cell.anlamLabel.text = anlamlarListe?[indexPath.row].anlam ?? "dd"
    
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dTableView.deselectRow(at: indexPath, animated: true)
        //tıkladıgımız secili kalmıyor geriye gittigimizde deselect
        
       // dTableView.sectionIndexColor = .blue
        let data = anlamlarListe?[indexPath.row].anlamID
        performSegue(withIdentifier:"goDetail", sender: data)
        
        
        let arananKelime = self.search
        performSegue(withIdentifier: "goDetail", sender:arananKelime)
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
       
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            print("Deleted")

              self.anlamlarListe?.remove(at: indexPath.row)
              self.dTableView.deleteRows(at: [indexPath], with: .automatic)
            self.dTableView.insertRows(at: [indexPath], with:.right)
          }
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail" {
            guard let mySender = sender as? String, let dvc = segue.destination as? DetailViewController  else { return }
            dvc.id = mySender
            dvc.gelenKelime = self.search
        }
       
    }
    
    
    
    
    
    
    
}

