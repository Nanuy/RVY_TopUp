document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (username === 'admin' && password === 'password123') {
        document.getElementById('message').textContent = 'Login successful!';
        document.getElementById('message').className = 'success';
        
        // Mengalihkan ke halaman index.html setelah 1 detik
        setTimeout(function() {
            window.location.href = 'index.html';
        }, 1000); // 1000 ms = 1 detik
    } else {
        document.getElementById('message').textContent = 'Invalid username or password.';
        document.getElementById('message').className = 'error';
    }
});