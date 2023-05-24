this.addEventListener("load", async () => {

    const respuestas = JSON.parse(localStorage.getItem("respuestas"));
    const filteredCars = await filterCars(respuestas)

    const sliderBack = document.getElementById("sliderBack")
    const sliderNext = document.getElementById("sliderNext")

    let counterCar = 0
    let carroActual = filteredCars[counterCar]

    if(filteredCars.length <= 1){
        sliderBack.style.visibility = 'hidden'
        sliderNext.style.visibility = 'hidden'
    }

    showCar(carroActual)

    sliderNext.addEventListener("click", () => {

        counterCar++
        carroActual = filteredCars[counterCar]
        sliderBack.style.visibility = 'visible'


        if (!carroActual) {
            counterCar = filteredCars.length - 1
            carroActual = filteredCars[counterCar]
            sliderNext.style.visibility = 'hidden'
            return
        }

        showCar(carroActual)


    })

    sliderBack.addEventListener("click", () => {

        counterCar--
        carroActual = filteredCars[counterCar]
        sliderNext.style.visibility = 'visible'

        if (!carroActual) {
            counterCar = 0
            carroActual = filteredCars[counterCar]
            sliderBack.style.visibility = 'hidden'
            return
        }

        showCar(carroActual)
    })

})

const getCars = async () => {
    let cars = []
    await fetch("http://localhost:8000")
        .then(response => response.json())
        .then(data => cars = data.carros)
        .catch(err => console.log(err))
    return cars
}

const filterCars = async (respuestas) => {
    let cars = []

    await fetch("http://localhost:8000/buscar/carros", {
        method: "POST",
        body: JSON.stringify(respuestas)
    })
        .then(response => response.json())
        .then(data => cars = data.carros)
        .catch(err => console.log(err))

    return cars
}

const showCar = async car => {

    const carBrandHTML = document.querySelector(".car__brand")
    const carModelHTML = document.querySelector(".car__model")
    const carFeaturesHTML = document.querySelector(".car__features")

    carBrandHTML.innerText = car.marca
    carModelHTML.innerText = `${car.modelo} ${car.generacion}`
    carModelHTML.innerHTML += ` <span>${car.anio}</span>`

    const { carroceria, numeropuertas, combustible, transmision, precio } = car

    const carFeaturesList = {
        "carroceria": carroceria,
        "numeropuertas": numeropuertas,
        "combustible": combustible,
        "transmision": transmision,
        "precio": precio
    }

    Object.entries(carFeaturesList).forEach(([feature, value], iterator) => {

        const featureDIV = carFeaturesHTML.children[iterator]
        const featureText = featureDIV.querySelector("P")

        featureText.innerHTML = `${value}`

        if (feature === "precio") {
            featureText.innerHTML = `$${value}`
        }

    })

}