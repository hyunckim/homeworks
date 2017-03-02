document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const favoriteSubmitHandler = (e) => {
    e.preventDefault();

    const favInput = document.querySelector(".favorite-input");
    const favSpot = favInput.value;
    favInput.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = favSpot;
    ul.appendChild(li);
  };

  const favoriteSubmitButton = document.querySelector(".favorite-submit");
  favoriteSubmitButton.addEventListener("click", favoriteSubmitHandler);

  // adding new photos

  const showPhotoForm = (e) => {
    e.preventDefault();

    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container") {
      photoForm.className = "photo-form-container hidden";
    } else { photoForm.className = "photo-form-container"; }
  };

  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", showPhotoForm);


  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoURLInput = document.querySelector(".photo-url-input");
    const photoURL = photoURLInput.value;
    photoURLInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoURL;

    const li = document.createElement("li");
    li.appendChild(newImg);

    const ul = document.querySelector(".dog-photos");
    ul.appendChild(li);
  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);

  }
);
