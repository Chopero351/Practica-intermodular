

package com.mycompany.intermodularprogramacion;

public class Moto extends Vehiculo {
    private String tipoMotor;
    private int cilindrada;

    public Moto(int id, String modelo, int anio, double precio, CategoriaVehiculo categoria,
                String tipoMotor, int cilindrada) {
        super(id, modelo, anio, precio, categoria);
        this.tipoMotor = tipoMotor;
        this.cilindrada = cilindrada;
    }

    public String getTipoMotor() {
        return tipoMotor;
    }

    public void setTipoMotor(String tipoMotor) {
        this.tipoMotor = tipoMotor;
    }

    public int getCilindrada() {
        return cilindrada;
    }

    public void setCilindrada(int cilindrada) {
        this.cilindrada = cilindrada;
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
        System.out.println("Moto: " + modelo + " (" + anio + ")");
        System.out.println("Precio: " + precio);
        System.out.println("Motor: " + tipoMotor);
        System.out.println("Cilindrada: " + cilindrada + " cc");
    }
}
