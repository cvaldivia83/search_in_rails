import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "form", "ipInput", "queryInput", "list", "emptySearch" ]
  connect() {
    this.handleInput = this.debounce(this.handleInput.bind(this), 1000);
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
          this.emptySearch.innerText = "Search Results";
          this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item);
        }
        this.formTarget.outerHTML = data.form;
      })
    }
  }
}
