$(document).ready(function () {
    // Ambil data dari localStorage
    let storedProduct = JSON.parse(localStorage.getItem("selectedProduct"));

    // Jika ada data, update elemen HTML
    if (storedProduct) {
        $("#product").text("Product Name: " + storedProduct.name);
        $("#Price").text("Price: IDR " + storedProduct.price);
    }
});