//
//  HomePage.swift
//  brianApps
//
//  Created by DEVALDA on 16/05/23.
//

import UIKit

class HomePage: UIViewController ,Coordinating{
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPostIsakuData()
      
    }
    
    func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    private func getPostNasaData(){
        
        let apiNasaKey = "FqoBlYD3Q9aTMoVFzK0GPbtcwdtogmbYq9Q4EjdG"
        var startDatePostKey = "2023-01-01"
        var endDatepostKey = "2023-01-10"
        let UrlPostNasa = "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(startDatePostKey)end_date=\(endDatepostKey)&api_key=\(apiNasaKey)"
        
        print("Post Nasa Data")
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: URL(string: UrlPostNasa)!) { Data, URLResponse, Error in
            guard let data = Data, Error == nil else{
                print("The Data is EMPTY!")
                return
            }
            
            var Result: Response?
            do{
                Result = try decoder.decode(Response.self,from: data)
            }
            catch{
                print("failed to decode JSON = \(error)")
            }
            
            
            
            guard let json = Result else{
                return
            }
            
            print("Total Data Element = \(json.elementCount)")
            print(json.nearEarthObjects)
        
        }
        
        task.resume()
        
    }
    
    
    private func getPostIsakuData(){
        print("post isaku data")
        
        let token = "0cjrf2-MuvsXD4wDgFeRM3FvcZk6WHukAWn1FB_yyXeZS2Gcm6MsvW4N6reJUpv494UrTNrstwluvB0ekJ7Yy810pnrqrCjKy2aGyrF3c6rT2v42op7O-kg4Tqd_VQVwmVxbWaJZvNXdexxc2Fkfeet0Kx6nOIo_WzoQiGPQCeRyOAwGO0Is-G-nW-HrFcq5i0SHcQKAUedBkuB8in2AI4N7SXG382qsGV-cAfiGDX1geyVOQUBr8aQsfEWWDs95EvydCC-E4C2Y5191x_eJcRmUUu6uGQP-KlAuuh-5QYB8fo2aXH-1vNm-pqVMXZEa"
        let body :[String:String] = [
            "json" :  "{\"phone_number\":\"088884444222\",\"app_version\":\"324\",\"os_version\":\"25\",\"os_type\":\"aos\",\"device_id\":\"aosxxxx\",\"imei\":\"123456\",\"session_id\":\"738112729\",\"latitude\":\"-8.539087\",\"longitude\":\"115.1399009\",\"bahasa\":\"1\"}",
            "tag" : "get_daftar_pekerjaan_v2"
        ]
        
       guard let UrlPostIsaku = URL( string:"https://devmob.1-saku.com/Index.aspx")else{
            return
        }
        
       let encoder = JSONEncoder()
       guard let encodeBody = try? encoder.encode(body)else{
            return
        }
        print("ENCODE DONE")
        
        var request = URLRequest(url: UrlPostIsaku)
        request.httpMethod = "POST"
        
        //Tidak perlu pake header
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")===
//        request.httpBody = encodeBody
        
        //POST <> form-data
        let postString = getPostString(params: body)
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { Data, URLResponse, Error in
            guard let data = Data, Error == nil else{
                print("The Data is EMPTY!")
                return
            }
            guard let httpRes = URLResponse as? HTTPURLResponse else {
                print("error", Error ?? "Unknown error")
                return
            }
            
            if httpRes.statusCode == 200 {
                if let data = Data {
                    print("RESPONSE DATA")
                    print(String(data: data, encoding: String.Encoding.utf8))
                    
                    print("DATA RESPONSE COLLECTED")
                    let decoder = JSONDecoder()
                    do{
                        var Result = try decoder.decode(ResponseIsaku.self,from: data)
                        print("DATA RESPONSE DECODED")
                        
                        print(Result.tag)
                        print(Result.success)
                        print(Result.data)
                    }
                    catch{
                        print("failed to decode JSON = \(error)")
                    }
                }
            }
        }
        
    task.resume()
        
    }
    
}

// ISAKU MODEL
struct ResponseIsaku: Codable{
    let tag, success, error: String
    let data: [String]
}


// MARK: - Response NASA MODEL
struct Response: Codable {
    let links: ResponseLinks
    let elementCount: Int
    let nearEarthObjects: [String: [NearEarthObject]]

    enum CodingKeys: String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
}

// MARK: - ResponseLinks
struct ResponseLinks: Codable {
    let next, previous, linksSelf: String

    enum CodingKeys: String, CodingKey {
        case next, previous
        case linksSelf = "self"
    }
}

// MARK: - NearEarthObject
struct NearEarthObject: Codable {
    let links: NearEarthObjectLinks
    let id, neoReferenceID, name: String
    let nasaJplURL: String
    let absoluteMagnitudeH: Double
    let estimatedDiameter: EstimatedDiameter
    let isPotentiallyHazardousAsteroid: Bool
    let closeApproachData: [CloseApproachDatum]
    let isSentryObject: Bool

    enum CodingKeys: String, CodingKey {
        case links, id
        case neoReferenceID = "neo_reference_id"
        case name
        case nasaJplURL = "nasa_jpl_url"
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case estimatedDiameter = "estimated_diameter"
        case isPotentiallyHazardousAsteroid = "is_potentially_hazardous_asteroid"
        case closeApproachData = "close_approach_data"
        case isSentryObject = "is_sentry_object"
    }
}

// MARK: - CloseApproachDatum
struct CloseApproachDatum: Codable {
    let closeApproachDate, closeApproachDateFull: String
    let epochDateCloseApproach: Int
    let relativeVelocity: RelativeVelocity
    let missDistance: MissDistance
    let orbitingBody: OrbitingBody

    enum CodingKeys: String, CodingKey {
        case closeApproachDate = "close_approach_date"
        case closeApproachDateFull = "close_approach_date_full"
        case epochDateCloseApproach = "epoch_date_close_approach"
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
        case orbitingBody = "orbiting_body"
    }
}

// MARK: - MissDistance
struct MissDistance: Codable {
    let astronomical, lunar, kilometers, miles: String
}

enum OrbitingBody: String, Codable {
    case earth = "Earth"
}

// MARK: - RelativeVelocity
struct RelativeVelocity: Codable {
    let kilometersPerSecond, kilometersPerHour, milesPerHour: String

    enum CodingKeys: String, CodingKey {
        case kilometersPerSecond = "kilometers_per_second"
        case kilometersPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
    }
}

// MARK: - EstimatedDiameter
struct EstimatedDiameter: Codable {
    let kilometers, meters, miles, feet: Feet
}

// MARK: - Feet
struct Feet: Codable {
    let estimatedDiameterMin, estimatedDiameterMax: Double

    enum CodingKeys: String, CodingKey {
        case estimatedDiameterMin = "estimated_diameter_min"
        case estimatedDiameterMax = "estimated_diameter_max"
    }
}

// MARK: - NearEarthObjectLinks
struct NearEarthObjectLinks: Codable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}



