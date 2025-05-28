document.addEventListener("DOMContentLoaded", () => {

    document.querySelectorAll("nav a").forEach(link => {
        link.addEventListener("click", function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute("href"));
            target.scrollIntoView({ behavior: "smooth" });
        });
    });


    const botonTema = document.createElement("button");
    botonTema.textContent = "Cambiar tema";
    botonTema.style.position = "fixed";
    botonTema.style.top = "10px";
    botonTema.style.right = "10px";
    botonTema.style.padding = "10px";
    botonTema.style.zIndex = "1000";
    document.body.appendChild(botonTema);

    botonTema.addEventListener("click", () => {
        document.body.classList.toggle("oscuro");
    });

    document.querySelectorAll("section").forEach(section => {
        const tabla = section.querySelector("table");
        if (tabla) {
            const boton = document.createElement("button");
            boton.textContent = "Mostrar/Ocultar tabla";
            boton.style.margin = "10px 0";
            boton.addEventListener("click", () => {
                tabla.style.display = tabla.style.display === "none" ? "table" : "none";
            });
            section.insertBefore(boton, tabla);
        }
    });

    document.querySelectorAll("tbody tr").forEach(fila => {
        fila.addEventListener("mouseenter", () => {
            fila.style.backgroundColor = "#ffe08a";
        });
        fila.addEventListener("mouseleave", () => {
            fila.style.backgroundColor = "";
        });
    });
});
