

package com.mycompany.intermodularprogramacion;


public class Coche extends Vehiculo {
    private int numPuertas;
    private String tipoCarroceria;

    public Coche(int id, String modelo, int anio, double precio, CategoriaVehiculo categoria,
                 int numPuertas, String tipoCarroceria) {
        super(id, modelo, anio, precio, categoria);
        this.numPuertas = numPuertas;
        this.tipoCarroceria = tipoCarroceria;
    }

    public int getNumPuertas() {
        return numPuertas;
    }

    public void setNumPuertas(int numPuertas) {
        this.numPuertas = numPuertas;
    }

    public String getTipoCarroceria() {
        return tipoCarroceria;
    }

    public void setTipoCarroceria(String tipoCarroceria) {
        this.tipoCarroceria = tipoCarroceria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public CategoriaVehiculo getCategoria() {
        return categoria;
    }

    public void setCategoria(CategoriaVehiculo categoria) {
        this.categoria = categoria;
    }

    @Override
    public void mostrarDatos() {
        System.out.println("Coche: " + modelo + " (" + anio + ")");
        System.out.println("Precio: " + precio);
        System.out.println("Puertas: " + numPuertas);
        System.out.println("Carrocería: " + tipoCarroceria);
    }
}

