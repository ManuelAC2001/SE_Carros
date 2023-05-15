
async function getCarros() {
    await fetch("http://localhost:8000/carros")
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(err => console.log(err))
}

this.onload = () => {
    getCarros()
}
