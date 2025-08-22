export class CreateProyectoDto {
  nombre_proyecto: string;
  descripcion_proyecto: string;
  fechaInicio: Date;
  fechaFin?: Date;
  porcentajeCompletado?: number;
  estado?: number;
}
