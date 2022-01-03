import Foundation
import UIKit

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    //let temperature_min: Double
    let tuuli: Double
    let tuulensuunta: Double
    let tuulenpuuska: Double
    let sunrise: Double
    let sunset: Double
    var image = UIImage()
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
//    var temperature_min_String: String {
//        return String(format: "%.1f", temperature_min)
//    }
    
    var tuuliString: String {
        return String(format: "%.1f", tuuli)
    }
    
    var tuulensuuntaString: String {
        return String(format: "%.0f", tuulensuunta)
    }
    
    var tuulenpuuskaString: String {
        return String(format: "%.0f", tuulenpuuska)
    }
    
    var sunriseString: String {
        return String(format: "%.0f", sunrise)
    }
    
    var sunsetString: String {
        return String(format: "%.0f", sunset)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
//    var imageView: UIImageView
//
//    var conditionBg: UIImageView {
//        switch conditionId {
//        case 200...232:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        case 300...321:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        case 500...531:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        case 600...622:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        case 701...781:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        case 800:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        case 801...804:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        default:
//            imageView.image = UIImage(named: "demokuva.png")
//            return imageView
//        }
//    }
    
}
