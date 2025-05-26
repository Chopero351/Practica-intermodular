

package com.mycompany.intermodularprogramacion;

public class DatoCurioso {
    private int idVehiculo;
    private String descripcion;

    public DatoCurioso(int idVehiculo, String descripcion) {
        this.idVehiculo = idVehiculo;
        this.descripcion = descripcion;
    }

    public int getIdVehiculo() { return idVehiculo; }
    public String getDescripcion() { return descripcion; }
}
