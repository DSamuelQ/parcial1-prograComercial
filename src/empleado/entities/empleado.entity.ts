import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Proyecto } from '../../proyecto/entities/proyecto.entity';

@Entity('empleados')
export class Empleado {
  @PrimaryGeneratedColumn()
  id_empleado: number;

  @Column()
  nombre_empleado: string;

  @Column()
  apellido_empleado: string;

  @Column()
  puesto_empleado: string;

  @Column('decimal')
  salario_empleado: number;

  @Column()
  email_empleado: string;

  @Column()
  telefono_empleado: string;

  @Column()
  direccion_empleado: string;

  @Column({ type: 'date' })
  fechaNacimiento: Date;

  @Column({ default: true })
  estado: boolean;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  createdAt: Date;

  @Column({
    type: 'timestamp',
    default: () => 'CURRENT_TIMESTAMP',
    onUpdate: 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date;

  @ManyToOne(() => Proyecto, (proyecto) => proyecto.empleados, {
    nullable: true,
  })
  proyecto?: Proyecto | null;
}
