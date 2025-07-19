import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "form", "ipInput", "queryInput", "list", "emptySearch" ]
  connect() {
    this.averageSpeed = 2500
    this.handleInput = this.debounce(this.handleInput.bind(this), this.averageSpeed);
  }
  
  typing_speed() {
    this.speed = 2500
    this.counter = 1
    const startTime = new Date().getTime();
    const endTime = new Date().getTime();
    const timeElapsed = endTime - startTime;
    this.speed += timeElapsed
    this.counter += 1;
    this.averageSpeed = this.speed / this.counter;
  }

  debounce(func, wait) {
    let timeout;

    return(...args) => {
      const context = this;

      clearTimeout(timeout)
      timeout = setTimeout(() => func.apply(context, args), wait)
    }
  }

  handleInput(event) {
    // calculate how fast the user types
    this.typing_speed();
    
    const url = this.formTarget.action;

    const options = {
      method: 'POST',
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    }
    
    if (this.queryInputTarget.value.trim() != "") {
      fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item);
        }
        this.formTarget.outerHTML = data.form;
      })
    }
  }
}
