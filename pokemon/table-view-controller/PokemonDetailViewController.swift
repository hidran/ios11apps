//
//  PokemonDetailViewController.swift
//  table-view-controller
//
//  Created by Hidran Arias on 07/08/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    var pokemonDetail:PokemonList?
    
    
    @IBOutlet weak var pokImg: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonName.text = pokemonDetail?.name
        pokImg.image = pokemonDetail?.getImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
       // performSegue(withIdentifier: "backToPokemonList", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
