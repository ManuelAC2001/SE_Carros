
async function getCarros() {
    let carros = []
    await fetch("http://localhost:8000")
        .then(response => response.json())
        .then(data => carros = data.carros)
        .catch(err => console.log(err))
    return carros
}

this.onload = async () => {
    let carros = await getCarros()
    // carros.forEach(c => console.log(c))

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
