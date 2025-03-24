const counter = document.querySelector(".counter-number");
async function updateCounter() {
    let response = await fetch("https://oypfmp47i2u3z4krtyeehcdfvy0vhwlk.lambda-url.us-west-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `Views: ${data}`;
}

updateCounter()