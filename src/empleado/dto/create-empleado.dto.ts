export class CreateEmpleadoDto {
  nombre_empleado: string;
  apellido_empleado: string;
  puesto_empleado: string;
  salario_empleado: number;
  email_empleado: string;
  telefono_empleado: string;
  direccion_empleado: string;
  fechaNacimiento: Date;
  proyectoId?: number;
  estado?: boolean;
}
