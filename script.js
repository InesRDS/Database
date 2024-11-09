/* navigator.geolocation.getCurrentPosition(function(data) {
    console.log(data)
}) */

//Might need to update browser seetings 
// https://home.openweathermap.org/users/sign_in
// https://temp-mail.org
// ID Key '5728f34643befa0d9cc117a200141288'
// https://openweathermap.org/current
// https://insomnia.rest/

const weatherIcon = document.querySelector('.weather-icon')
const weatherLocation = document.querySelector('.weather-location')
const weatherTemperature = document.querySelector('.weather-temperature')
const descriptionElement = document.querySelector('.description-element')
const htmlElement = document.querySelector('.htmlElement')

navigator.geolocation.getCurrentPosition(onSuccess, onError)

function onSuccess (data){
    console.log(data)

    const lon = data.coords.longitude
    const lat = data.coords.latitude

    const endpoint = ''
    const url = ''

    fetch(url)
        .then(function(res){
            return res.json()
        })
        .then(function(data) {
            console.log(data)

            const iconCode = data.weather[0].iconCode
            const description = data.weather[0].description
            const temp = Math.floor(data.main.temp)

            //choose right image based on weather data
            weatherIcon.src=`images/${iconCode}.png`
            weatherIcon.alt = description

            weatherLocation.innerText = data.name

            //choose right description
            //show temp
            weatherTemperature.innerText = temp
            descriptionElement.innerText = description[iconCode]

            //remove the opacity
            htmlElement.classList.remove('js-loading')

        })

}

function onError (error) {
    console.error (error)
}

const descriptions = {
    '01d': 'Remember to apply sunscreen'
}

/* https://app.netlify.com/drop 
A way for other people to access your 'app' */
