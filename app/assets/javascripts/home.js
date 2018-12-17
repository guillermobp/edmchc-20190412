//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require Parallax
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

  new Parallax(".parallax-top", {
    offsetYBounds: 50,
    intensity: 80,
    center: 0.3,
    safeHeight: 0.15
  }).init();

  new Parallax(".parallax-bottom", {
    offsetYBounds: 50,
    intensity: 75,
    center: 0.5,
    safeHeight: 0.15
  }).init();
});
