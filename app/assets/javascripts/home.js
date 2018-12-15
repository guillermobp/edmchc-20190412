//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require lightbox
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  // Handle navbar item active state.
  if (document.querySelector("nav")) {
    document.querySelector("nav").addEventListener("click", ({ target }) => {
      document.querySelectorAll("nav a").forEach(a => {
        a.classList.remove("is-active");
      });
      target.classList.add("is-active");
    });
  }
});
