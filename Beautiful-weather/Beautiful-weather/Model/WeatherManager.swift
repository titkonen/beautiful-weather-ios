import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

// http://api.openweathermap.org/data/2.5/weather?q=helsinki&appid=99fbb18d7ecedc2983075cf0df822b4e
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=99fbb18d7ecedc2983075cf0df822b4e&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            //let temp_min = decodedData.main.temp_min
            let name = decodedData.name
            let windSpeed = decodedData.wind.speed
            let windDegree = decodedData.wind.deg
            let windGust = decodedData.wind.gust
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, tuuli: windSpeed, tuulensuunta: windDegree, tuulenpuuska: windGust) // , temperature_min: temp_min
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
