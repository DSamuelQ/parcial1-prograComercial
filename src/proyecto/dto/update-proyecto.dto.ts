import { PartialType } from '@nestjs/mapped-types';
import { CreateProyectoDto } from './create-proyecto.dto';

export class UpdateProyectoDto extends PartialType(CreateProyectoDto) {
  nombre_proyecto?: string;
  descripcion_proyecto?: string;
  fechaInicio?: Date;
  fechaFin?: Date;
  porcentajeCompletado?: number;
  estado?: number;
}
