    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    const mainContent = document.querySelector('.main'); // Ambil elemen utama

    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        navMenu.classList.toggle('active');

        // Jika menu aktif, dorong konten ke bawah
        if (navMenu.classList.contains('active')) {
            mainContent.style.marginTop = "200px"; // Sesuaikan dengan tinggi menu
        } else {
            mainContent.style.marginTop = "0"; // Kembalikan ke posisi awal
        }
    });

    // Tutup menu saat salah satu link diklik & kembalikan posisi main
    document.querySelectorAll('.nav-link').forEach(n => n.addEventListener('click', () => {
        hamburger.classList.remove('active');
        navMenu.classList.remove('active');
        mainContent.style.marginTop = "0"; // Kembalikan ke posisi awal
    }));
