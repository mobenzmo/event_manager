// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "bootstrap";
import "@popperjs/core";


document.addEventListener("DOMContentLoaded", function() {
  var triggerTabList = [].slice.call(document.querySelectorAll('.nav-link'))
  triggerTabList.forEach(function(triggerEl) {
    var tabTrigger = new bootstrap.Tab(triggerEl)
    triggerEl.addEventListener('click', function(event) {
      event.preventDefault()
      tabTrigger.show()
    })
  })
})
