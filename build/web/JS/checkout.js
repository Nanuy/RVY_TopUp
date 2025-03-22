$(document).ready(function () {
    // Ambil data produk dari localStorage
    let storedProduct = JSON.parse(localStorage.getItem("selectedProduct"));

    if (storedProduct) {
        console.log("Stored Product:", storedProduct); // Debugging

        // Masukkan data ke elemen yang memiliki id 'product' dan 'price'
        $("#product").text(storedProduct.name);
        $("#price").text(storedProduct.price);

        // Fungsi untuk menampilkan item jika ada isinya
        function showItem(selector, value) {
            if (value) {
                $(selector).text(value).show();
            } else {
                $(selector).hide();
            }
        }

        // Tampilkan hanya jika item tidak kosong
        showItem("#item1", storedProduct.item1);
        showItem("#item2", storedProduct.item2);
        showItem("#item3", storedProduct.item3);
        showItem("#item4", storedProduct.item4);
        showItem("#item5", storedProduct.item5);
    } else {
        console.log("No product found in localStorage"); // Debugging jika tidak ada data
    }
});
