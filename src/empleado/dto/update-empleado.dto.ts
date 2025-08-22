import { PartialType } from '@nestjs/mapped-types';
import { CreateEmpleadoDto } from './create-empleado.dto';

export class UpdateEmpleadoDto extends PartialType(CreateEmpleadoDto) {
  nombre_empleado?: string;
  apellido_empleado?: string;
  puesto_empleado?: string;
  salario_empleado?: number;
  email_empleado?: string;
  telefono_empleado?: string;
  direccion_empleado?: string;
  fechaNacimiento?: Date;
  estado?: boolean;
  proyectoId?: number;
}
