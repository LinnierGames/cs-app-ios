//
//  QuickLinksViewController.swift
//  CS App
//
//  Created by Erick Sanchez on 1/23/17.
//  Copyright © 2017 SRJC Computer Science Club. All rights reserved.
//

import UIKit

let CS_WEBSITE_URL = "http://srjccs.club/"
let GITHUB_URL = "https://github.com/SRJC-Computer-Science-Club"
let GOOGLE_DRIVE_URL = "https://drive.google.com/drive/folders/0B3w_oG_fvJvqUDNiXzZUY3l2Q2M?usp=sharing"
let CURRENT_MEETING_URL = "https://docs.google.com/document/d/1dnEZraRgMyhRGBvEnHLNsXxZfMpoVAWcDMCOxGFiyeE/edit?usp=sharing"
let CHECKVIST_URL = "https://checkvist.com/"
let FIGMA_URL = "https://figma.com/"
let ROBOGAMES_URL = "http://robogames.net/rules/line-following.php"
let ASANA_URL = "https://asana.com/"

class QuickLinksViewController: UITableViewController {
    
    struct Link {
        var link : String
        var caption : String?
        var url : String
    }
    
    private let arrayLinks = [[
        Link(link: "SRJC CS Website", caption: "club hub and website", url: CS_WEBSITE_URL),
        Link(link: "GitHub Organization", caption: "project source code and version control", url: GITHUB_URL),
        Link(link: "Google Drive Folder", caption: "offical policies and job project folders", url: GOOGLE_DRIVE_URL),
        Link(link: "Meeting Agenda", caption: "check out what's happening in the next upcomming meeting", url: CURRENT_MEETING_URL)],[
            Link(link: "Checkvist", caption: "brainstorm and share outlines on projects", url: CHECKVIST_URL),
            Link(link: "Figma", caption: "collabroate on a design or graphic", url: FIGMA_URL)],[
                Link(link: "Robo Games", caption: "competition for the Line-Follower project", url: ROBOGAMES_URL),
                Link(link: "Asana", caption: "our past agenda service", url: ASANA_URL)]]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayLinks.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLinks[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let link = arrayLinks[indexPath.section][indexPath.row]
            cell.textLabel!.text = link.link
            cell.detailTextLabel!.text = link.caption ?? ""
            
            if (URL(string: link.url) != nil) {
                cell.accessoryType = .disclosureIndicator
            } else {
                cell.accessoryType = .none
            }
            
            return cell
            
        }
        
        return UITableViewCell(style: .default, reuseIdentifier: "")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: arrayLinks[indexPath.section][indexPath.row].url) {
            UIApplication.shared.open( url, options: [:], completionHandler: nil)
            tableView.deselectRow(at: indexPath, animated: false)
            
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
