document.addEventListener('DOMContentLoaded', () => {
    const signinForm = document.getElementById('signin-form');
    const signupForm = document.getElementById('signup-form');
  
    signinForm.addEventListener('submit', (event) => {
      event.preventDefault(); // Prevent default form submission
  
      const formData = new FormData(signinForm);
  
      fetch('/api/v1/auth/login', {
        method: 'POST',
        body: formData
      })
    .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
      })
    .then(data => {
        if (data.token) {
          localStorage.setItem('jwt_token', data.token);
          window.location.href = '/events';
        } else {
          // Display specific error message from API response
          alert(data.error || "Invalid credentials");
        }
      })
    .catch(error => {
        console.error('Error:', error);
        alert("An error occurred during login.");
      });
    });

    signupForm.addEventListener('submit', (event) => {
        event.preventDefault(); // Prevent default form submission
      
        const formData = new FormData(signupForm);
      
        fetch('/api/v1/users', { // Your signup API endpoint
          method: 'POST',
          body: formData
        })
        .then(response => {
          if (!response.ok) {
            return response.json().then(err => {throw new Error(err.errors.join(', '))}) // Throw error with details
          }
          return response.json();
        })
        .then(data => {
          if (data.token) {
            localStorage.setItem('jwt_token', data.token);
            window.location.href = '/events'; // Redirect after successful signup
          } else {
            // Display error message, if any
            alert(data.error || "Signup failed. Please try again.");
          }
        })
        .catch(error => {
          console.error('Error:', error);
          alert("An error occurred during signup: " + error.message); // Display error message
        });
      });
  });
