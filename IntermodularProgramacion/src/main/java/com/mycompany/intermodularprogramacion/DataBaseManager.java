

package com.mycompany.intermodularprogramacion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DataBaseManager {

    private static final String URL = "jdbc:mysql://localhost:3306/practica_intermodular";
    private static final String USER = "root";
    private static final String PASSWORD = "Med@c";

    private Connection connection;

    private List<CategoriaVehiculo> categorias = new ArrayList<>();
    private List<Vehiculo> vehiculos = new ArrayList<>();
    private List<DatoCurioso> datosCuriosos = new ArrayList<>();

    public void conectar() {
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexion exitosa");
        } catch (SQLException e) {
            System.out.println("Error al conectar: " + e.getMessage());
        }
    }

    public void desconectar() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Conexion cerrada");
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar conexion: " + e.getMessage());
        }
    }

    public void cargarDatos() {
        conectar();
        cargarCategorias();
        cargarVehiculos();
        cargarDatosCuriosos();
        desconectar();
    }

    private void cargarCategorias() {
        categorias.add(new CategoriaVehiculo("Coche"));
        categorias.add(new CategoriaVehiculo("Moto"));
    }

    private void cargarVehiculos() {
        String queryCoches = """
            SELECT v.id, v.modelo, v.anio, v.precio, c.num_puertas, c.tipo_carroceria
            FROM vehiculos v
            JOIN coches c ON v.id = c.id
        """;

        String queryMotos = """
            SELECT v.id, v.modelo, v.anio, v.precio, m.tipo_motor, m.cilindrada
            FROM vehiculos v
            JOIN motos m ON v.id = m.id
        """;

        try (Statement stmt = connection.createStatement()) {

            ResultSet rsCoches = stmt.executeQuery(queryCoches);
            while (rsCoches.next()) {
                CategoriaVehiculo categoria = buscarCategoria("Coche");
                Coche coche = new Coche(
                    rsCoches.getInt("id"),
                    rsCoches.getString("modelo"),
                    rsCoches.getInt("anio"),
                    rsCoches.getDouble("precio"),
                    categoria,
                    rsCoches.getInt("num_puertas"),
                    rsCoches.getString("tipo_carroceria")
                );
                vehiculos.add(coche);
            }

            ResultSet rsMotos = stmt.executeQuery(queryMotos);
            while (rsMotos.next()) {
                CategoriaVehiculo categoria = buscarCategoria("Moto");
                Moto moto = new Moto(
                    rsMotos.getInt("id"),
                    rsMotos.getString("modelo"),
                    rsMotos.getInt("anio"),
                    rsMotos.getDouble("precio"),
                    categoria,
                    rsMotos.getString("tipo_motor"),
                    rsMotos.getInt("cilindrada")
                );
                vehiculos.add(moto);
            }

        } catch (SQLException e) {
            System.out.println("Error cargando vehiculos: " + e.getMessage());
        }
    }

    private void cargarDatosCuriosos() {
        String query = "SELECT id_vehiculo, curiosidad FROM datos_curiosos";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                int idVehiculo = rs.getInt("id_vehiculo");
                String texto = rs.getString("curiosidad");

                DatoCurioso dato = new DatoCurioso(idVehiculo, texto);
                datosCuriosos.add(dato);
            }

        } catch (SQLException e) {
            System.out.println("Error cargando datos curiosos: " + e.getMessage());
        }
    }

    private CategoriaVehiculo buscarCategoria(String nombre) {
        for (CategoriaVehiculo c : categorias) {
            if (c.getNombre().equalsIgnoreCase(nombre)) {
                return c;
            }
        }
        return null;
    }

    public List<CategoriaVehiculo> getCategorias() {
        return categorias;
    }

    public List<Vehiculo> getVehiculos() {
        return vehiculos;
    }

    public List<DatoCurioso> getDatosCuriosos() {
        return datosCuriosos;
    }
}
