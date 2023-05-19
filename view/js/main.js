this.onload = async () => {

    const cars = await filterCars()
    showCar(cars[0])
}

const getCars = async () => {
    let cars = []
    await fetch("http://localhost:8000")
        .then(response => response.json())
        .then(data => cars = data.carros)
        .catch(err => console.log(err))
    return cars
}

const filterCars = async () => {
    let cars = []

    const dataExample = {
        transmision: "automatico",
        combustible: "electrico",
        numeropuertas: 2,
        carroceria: "convertible",
    }


    await fetch("http://localhost:8000/buscar/carros", {
        method: "POST",
        body: JSON.stringify(dataExample)
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

    const carFeaturesList = [
        car.carroceria,
        car.numeropuertas,
        car.combustible,
        car.transmision,
        car.precio
    ]

    Array.from(carFeaturesHTML.children).forEach((featureDIV, key) => {

        const featureText = featureDIV.querySelector("P")
        featureText.innerText += `${carFeaturesList[key]}`
    })



}