this.onload = () => {

    const form = document.getElementById("form")

    const answersContainer = document.querySelector(".answers__container")
    const legendAnswers = answersContainer.getElementsByTagName("LEGEND")[0]

    const answersCombustible = document.getElementById('answersCombustible')
    const answersTransmision = document.getElementById('answersTransmision')
    const answersPuertas = document.getElementById('answersPuertas')
    const answersCarroceria = document.getElementById('answersCarroceria')

    answersTransmision.style.display = 'none'
    answersPuertas.style.display = 'none'
    answersCarroceria.style.display = 'none'


    form.addEventListener("submit", event => {
        event.preventDefault()

        let respuestas = {}
        new FormData(form).forEach((value, key) => respuestas[key] = value);

        if (respuestas.combustible) {
            answersCombustible.style.display = "none"
            answersTransmision.style.display = 'flex'

            legendAnswers.textContent = "¿Cual es el tipo de transmision que desea?"
        }

        if (respuestas.transmision) {
            answersTransmision.style.display = 'none'
            answersPuertas.style.display = 'flex'
            legendAnswers.textContent = "¿Cual es el numero de puertas que desea?"
        }

        if (respuestas.numeropuertas) {
            
            if(!isNaN(respuestas.numeropuertas)){
                respuestas.numeropuertas = parseInt(respuestas.numeropuertas)
            }
            answersPuertas.style.display = 'none'
            answersCarroceria.style.display = 'flex'
            legendAnswers.textContent = "¿Cual es el tipo de carroceria que desea?"
        }

        listPropiedades = [
            'combustible',
            'transmision',
            'numeropuertas',
            'carroceria',
        ]

        for (propiedad of listPropiedades) {
            if(!respuestas.hasOwnProperty(propiedad)){
                return
            }
        }
        localStorage.setItem("respuestas", JSON.stringify(respuestas));
        window.location.replace("../templates/cars.html");
    })
}