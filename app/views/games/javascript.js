document.addEventListener("DOMContentLoaded", function() {
  document.querySelector("form").addEventListener("submit", function(event) {
    event.preventDefault();

    
    let size = document.querySelector("#size").innerHTML;  // Taille de la liste
    let point = 0;  // On va compter les bonnes réponses

    // On itére sur chaque mot
    for (let i = 1; i <= size; i++) {
      // On récupère la div du mot, l'input, le français et sa traduction
      let divWord = document.getElementById("word" + i.toString());
      let input = document.querySelector("#input" + i.toString()).value;
      let french = document.querySelector("#french" + i.toString()).innerHTML;
      let spanish = document.getElementById("spanish" + i.toString()).innerHTML;

      if (input == spanish) {
        // Si la réponse est juste
        divWord.style.backgroundColor = "green";
        point++; // Incrémentation
      } else {
        // Si la réponse est fausse
        divWord.insertAdjacentHTML('beforeend', `${french} => ${spanish}`)
        divWord.style.backgroundColor = "red";
      }
    };

    // On display le résultat
    let divScore = document.getElementById("score");

    if (point / size <= 0.5) {
      divScore.innerHTML = `Ton score pauvre merde: ${point} / ${size} !`;
    } else if (0.5 <= point / size < 1) { 
      divScore.innerHTML = `Pas mal Anakin: ${point} / ${size} !`;
    }
  });
});
