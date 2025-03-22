    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    const mainContent = document.querySelector('.main'); // Ambil elemen utama

    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        navMenu.classList.toggle('active');

        // Jika menu aktif, dorong konten ke bawah
        if (navMenu.classList.contains('active')) {
            mainContent.style.marginTop = "35vh"; // Sesuaikan dengan tinggi menu
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

 
    $(document).ready(function () {
        $(document).on("click", ".buyNow", function () {
            // Ambil data dari tombol yang diklik
            let product = {
                id: $(this).data("product-id"),
                name: $(this).data("product-name"),
                price: $(this).data("price"),
                item1: $(this).data("item1"),
                item2: $(this).data("item2"),
                item3: $(this).data("item3"),
                item4: $(this).data("item4"),
                item5: $(this).data("item5")
            };
    
            console.log("Product selected:", product); // Debugging
    
            // Simpan ke localStorage
            localStorage.setItem("selectedProduct", JSON.stringify(product));
    
            // Redirect ke checkout
            window.location.href = "checkout.html";
        });
    });
    