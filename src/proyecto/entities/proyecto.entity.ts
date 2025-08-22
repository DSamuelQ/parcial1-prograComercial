import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Empleado } from '../../empleado/entities/empleado.entity';

@Entity('proyectos')
export class Proyecto {
  @PrimaryGeneratedColumn()
  id_proyecto: number;

  @Column()
  nombre_proyecto: string;

  @Column()
  descripcion_proyecto: string;

  @Column({ type: 'date' })
  fechaInicio: Date;

  @Column({ type: 'date', nullable: true })
  fechaFin: Date;

  @Column({ type: 'float', default: 0 })
  porcentajeCompletado: number;

  @Column({ type: 'tinyint', default: 1 })
  estado: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  createdAt: Date;

  @Column({
    type: 'timestamp',
    default: () => 'CURRENT_TIMESTAMP',
    onUpdate: 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date;

  @OneToMany(() => Empleado, (empleado) => empleado.proyecto)
  empleados: Empleado[];
}
