
package com.mycompany.intermodularprogramacion;

import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        DataBaseManager dbManager = new DataBaseManager();
        dbManager.cargarDatos();
        Scanner scanner = new Scanner(System.in);
        int opcion = 0;

        do {
            System.out.println("\n--- Explorador de Vehiculos ---");
            System.out.println("1. Ver categorias");
            System.out.println("2. Ver listado de vehiculos");
            System.out.println("3. Ver datos curiosos");
            System.out.println("4. Salir");
            System.out.print("Selecciona una opcion: ");

            try {
                opcion = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Por favor ingresa un numero valido");
                continue;
            }

            switch (opcion) {
                case 1 -> {
                    List<CategoriaVehiculo> categorias = dbManager.getCategorias();
                    if (categorias.isEmpty()) {
                        System.out.println("No hay categorias disponibles");
                        break;
                    }

                    System.out.println("\nCategorias:");
                    for (int i = 0; i < categorias.size(); i++) {
                        System.out.println((i + 1) + ". " + categorias.get(i).getNombre());
                    }
                    System.out.print("Selecciona una categoria para ver sus vehiculos (0 para volver): ");

                    int catOpcion = -1;
                    while (catOpcion < 0 || catOpcion > categorias.size()) {
                        try {
                            catOpcion = Integer.parseInt(scanner.nextLine());
                            if (catOpcion < 0 || catOpcion > categorias.size())
                                System.out.print("Opcion invalida, intenta de nuevo: ");
                        } catch (NumberFormatException e) {
                            System.out.print("Por favor ingresa un numero valido: ");
                        }
                    }
                    if (catOpcion == 0) break;

                    CategoriaVehiculo categoriaSeleccionada = categorias.get(catOpcion - 1);
                    System.out.println("\nVehiculos en categoria " + categoriaSeleccionada.getNombre() + ":");
                    int contador = 0;
                    for (Vehiculo v : dbManager.getVehiculos()) {
                        if (v.getCategoria().getNombre().equalsIgnoreCase(categoriaSeleccionada.getNombre())) {
                            contador++;
                            System.out.println(contador + ". " + v.getModelo());
                        }
                    }
                    if (contador == 0) {
                        System.out.println("No hay vehiculos en esta categoria");
                    }
                    System.out.print("Presiona enter para volver al menu principal...");
                    scanner.nextLine();
                }
                case 2 -> {
                    List<Vehiculo> vehiculos = dbManager.getVehiculos();
                    if (vehiculos.isEmpty()) {
                        System.out.println("No hay vehiculos disponibles");
                        break;
                    }

                    System.out.println("\nListado de vehiculos:");
                    for (int i = 0; i < vehiculos.size(); i++) {
                        System.out.println((i + 1) + ". " + vehiculos.get(i).getModelo());
                    }
                    System.out.print("Selecciona un vehiculo para ver detalles (0 para volver): ");

                    int vehOpcion = -1;
                    while (vehOpcion < 0 || vehOpcion > vehiculos.size()) {
                        try {
                            vehOpcion = Integer.parseInt(scanner.nextLine());
                            if (vehOpcion < 0 || vehOpcion > vehiculos.size())
                                System.out.print("Opcion invalida, intenta de nuevo: ");
                        } catch (NumberFormatException e) {
                            System.out.print("Por favor ingresa un numero valido: ");
                        }
                    }
                    if (vehOpcion == 0) break;

                    Vehiculo vehiculoSeleccionado = vehiculos.get(vehOpcion - 1);
                    System.out.println("\nDetalles del vehiculo:");
                    System.out.println("Modelo: " + vehiculoSeleccionado.getModelo());
                    System.out.println("Anio: " + vehiculoSeleccionado.getAnio());
                    System.out.println("Precio: $" + vehiculoSeleccionado.getPrecio());
                    System.out.println("Categoria: " + vehiculoSeleccionado.getCategoria().getNombre());

                    if (vehiculoSeleccionado instanceof Coche coche) {
                        System.out.println("Numero de puertas: " + coche.getNumPuertas());
                        System.out.println("Tipo de carroceria: " + coche.getTipoCarroceria());
                    } else if (vehiculoSeleccionado instanceof Moto moto) {
                        System.out.println("Tipo de motor: " + moto.getTipoMotor());
                        System.out.println("Cilindrada: " + moto.getCilindrada() + " cc");
                    }

                    System.out.println("\nDatos curiosos:");
                    boolean tieneDatos = false;
                    for (DatoCurioso d : dbManager.getDatosCuriosos()) {
                        if (d.getIdVehiculo() == vehiculoSeleccionado.getId()) {
                            System.out.println("- " + d.getDescripcion());
                            tieneDatos = true;
                        }
                    }
                    if (!tieneDatos) {
                        System.out.println("No hay datos curiosos disponibles");
                    }
                    System.out.print("Presiona enter para volver al menu principal...");
                    scanner.nextLine();
                }
                case 3 -> {
                    List<DatoCurioso> datos = dbManager.getDatosCuriosos();
                    List<Vehiculo> vehiculos = dbManager.getVehiculos();

                    if (datos.isEmpty()) {
                        System.out.println("No hay datos curiosos disponibles");
                        break;
                    }

                    System.out.println("\nDatos curiosos:");
                    for (DatoCurioso d : datos) {
                        String modelo = "Desconocido";
                        for (Vehiculo v : vehiculos) {
                            if (v.getId() == d.getIdVehiculo()) {
                                modelo = v.getModelo();
                                break;
                            }
                        }
                        System.out.println("- " + d.getDescripcion() + " (Vehiculo: " + modelo + ")");
                    }
                    System.out.print("Presiona enter para volver al menu principal...");
                    scanner.nextLine();
                }
                case 4 -> System.out.println("Saliendo...");
                default -> System.out.println("Opcion invalida");
            }
        } while (opcion != 4);

        scanner.close();
    }
}
