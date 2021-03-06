/*
Github Username - AverageDragon
6/2/2019
The javascript for the navbar in the cEDH Decklist Database.
*/
(function() {
  "use strict";

  window.addEventListener("load", init);

  /**
  * @description {Initializes the code and adds event listeners}
  */
  function init() {
    if (window.location.href.indexOf("primary") > -1) {
      id("primary").classList.add("active");
    } else if (window.location.href.indexOf("submissions") > -1) {
      id("submissions").classList.add("active");
    } else if (window.location.href.indexOf("outdated") > -1) {
      id("outdated").classList.add("active");
    } else if (window.location.href.indexOf("memes") > -1) {
      id("memes").classList.add("active");
    } else {
      window.location.href = "primary.html";
    }
  }

  /**
   * Returns the element that has the ID attribute with the specified value.
   * @param {string} idName - element ID
   * @returns {object} DOM object associated with id.
   */
  function id(idName) {
    return document.getElementById(idName);
  }
})();
