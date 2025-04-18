const counter = document.querySelector(".counter-number");
async function updateCounter() {
    let response = await fetch("https://3gym4p3cnwvcbtdz4fss5hpm2y0kxjmj.lambda-url.us-west-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `Views: ${data}`;
}

updateCounter()