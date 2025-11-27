document.addEventListener("DOMContentLoaded", () => {
    const addButton = document.getElementById("add-choice");
    const choicesDiv = document.getElementById("choices");
  
    addButton.addEventListener("click", (e) => {
      e.preventDefault();
      const newChoice = choicesDiv.children[0].cloneNode(true);
      newChoice.querySelector("input[type=text]").value = "";
      newChoice.querySelector("input[type=checkbox]").checked = false;
      choicesDiv.appendChild(newChoice);
    });
  
    choicesDiv.addEventListener("click", (e) => {
      if (e.target.classList.contains("remove-choice")) {
        e.preventDefault();
        if (choicesDiv.children.length > 2) { // 2つ以下にならないように
          e.target.parentNode.remove();
        }
      }
    });
  });
  