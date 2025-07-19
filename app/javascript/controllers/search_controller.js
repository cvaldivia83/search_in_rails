import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "form", "input", "list" ]

  connect() {
    this.averageSpeed = 1500;
    this.handleSearch = this.debounce(this.handleSearch.bind(this), this.averageSpeed)
  }

  typing_speed() {
    this.speed = 1500
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

  handleSearch(event) {
    // calculate how fast the user types
    this.typing_speed();

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;

    const options = {
      headers: { "Accept": "text/plain" }
    }

    fetch(url, options)
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data;
    })
  }
}
