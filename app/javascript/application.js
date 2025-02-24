document.addEventListener("DOMContentLoaded", function() {
    const profileIcon = document.querySelector(".profile-toggle");
    const dropdownMenu = document.querySelector(".dropdown-menu");

    if (profileIcon && dropdownMenu) {
        profileIcon.addEventListener("click", function(event) {
            event.stopPropagation(); // Prevents event from bubbling up
            dropdownMenu.classList.toggle("show"); // Toggle dropdown visibility
        });

        // Close dropdown if clicking outside
        document.addEventListener("click", function(event) {
            if (!dropdownMenu.contains(event.target) && !profileIcon.contains(event.target)) {
                dropdownMenu.classList.remove("show");
            }
        });
    }
});
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".return-button, .borrow-button").forEach(function (button) {
      button.addEventListener("click", function (event) {
        let bookTitle = this.dataset.bookTitle;
        let actionType = this.classList.contains("return-button") ? "return" : "borrow";
  
        let confirmation = confirm(`Are you sure you want to ${actionType} '${bookTitle}'?`);
        if (!confirmation) {
          event.preventDefault(); // Stop action if user cancels
        }
      });
    });
  });
  