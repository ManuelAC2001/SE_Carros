
async function getCarros() {
    let carros = []
    await fetch("http://localhost:8000/carros")
        .then(response => response.json())
        .then(data => carros = data.carros)
        .catch(err => console.log(err))
    return carros
}

this.onload = async () => {
    let carros = await getCarros()
    carros.forEach(c => console.log(c))
}
