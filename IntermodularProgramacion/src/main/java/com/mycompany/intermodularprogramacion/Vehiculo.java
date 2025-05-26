

package com.mycompany.intermodularprogramacion;


public abstract class Vehiculo {
    protected int id;
    protected String modelo;
    protected int anio;
    protected double precio;
    protected CategoriaVehiculo categoria;

    public Vehiculo(int id, String modelo, int anio, double precio, CategoriaVehiculo categoria) {
        this.id = id;
        this.modelo = modelo;
        this.anio = anio;
        this.precio = precio;
        this.categoria = categoria;
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

    
    
    public int getId() { return id; }
    public String getModelo() { return modelo; }
    public CategoriaVehiculo getCategoria() { return categoria; }

    public abstract void mostrarDatos();
}
