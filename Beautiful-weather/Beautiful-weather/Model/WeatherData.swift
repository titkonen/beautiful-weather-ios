import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
//    let windDegree: WindDegree
}

struct Main: Codable {
    let temp: Double
    //let temp_min: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
    let gust: Double
}
