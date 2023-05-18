this.onload = async () => {
    // showCars()
    // filterCars()
    const carros = await  getCars()
    carros.forEach( carro => console.log(carro))
}

const getCars = async () => {
    let carros = []
    await fetch("http://localhost:8000")
        .then(response => response.json())
        .then(data => carros = data.carros)
        .catch(err => console.log(err))
        return carros
}

const filterCars = async () => {
    
    const dataExample = {
        transmision: "estandar",
        combustible: "electrico",
        numeropuertas: 2,
        carroceria: "convertible",
    }


    await fetch("http://localhost:8000/buscar/carros", {
        method: "POST",
        body: JSON.stringify(dataExample)
    })
        .then(response => response.json())
        .then(data => {
            const carros = data.carros
            carros.forEach(carro => console.log(carro))
        })
        .catch(err => console.log(err))
        
    }
    
const showCars = async () => {

    let carros = await getCars()
    let carContainer = document.querySelector(".car__container")

    carros.forEach(carro => {
        carContainer.innerHTML += `
        
        <div class="car_card">
        <p>Marca: ${carro.marca}</p>
        <p>Modelo: ${carro.modelo}</p>
        <p>Generación: ${carro.generacion}</p>
            <p>Año de salida: ${carro.anio}</p>
            <p>Carroceria: ${carro.carroceria}</p>
            <p>Número de puertas: ${carro.numeropuertas}</p>
            <p>Combustible: ${carro.combustible}</p>
            <p>Transmisión: ${carro.transmision}</p>
            <p>Precio : $${carro.precio}</p>
        </div>
        </br>
        `
    })
}