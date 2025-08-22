import {
  Injectable,
  NotFoundException,
  BadRequestException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Empleado } from './entities/empleado.entity';
import { CreateEmpleadoDto } from './dto/create-empleado.dto';
import { UpdateEmpleadoDto } from './dto/update-empleado.dto';
import { Proyecto } from '../proyecto/entities/proyecto.entity';

@Injectable()
export class EmpleadoService {
  constructor(
    @InjectRepository(Empleado)
    private empleadoRepository: Repository<Empleado>,
    @InjectRepository(Proyecto)
    private proyectoRepository: Repository<Proyecto>,
  ) {}

  async create(createEmpleadoDto: CreateEmpleadoDto): Promise<Empleado> {
    let proyecto: Proyecto | null = null;
    if (createEmpleadoDto.proyectoId) {
      proyecto = await this.proyectoRepository.findOne({
        where: { id_proyecto: createEmpleadoDto.proyectoId },
      });
      if (!proyecto) throw new NotFoundException('Proyecto no encontrado');
    }
    const empleado = this.empleadoRepository.create({
      nombre_empleado: createEmpleadoDto.nombre_empleado,
      apellido_empleado: createEmpleadoDto.apellido_empleado,
      puesto_empleado: createEmpleadoDto.puesto_empleado,
      salario_empleado: createEmpleadoDto.salario_empleado,
      email_empleado: createEmpleadoDto.email_empleado,
      telefono_empleado: createEmpleadoDto.telefono_empleado,
      direccion_empleado: createEmpleadoDto.direccion_empleado,
      fechaNacimiento: createEmpleadoDto.fechaNacimiento,
      estado: createEmpleadoDto.estado ?? true,
      proyecto: proyecto ?? null,
    });
    return this.empleadoRepository.save(empleado);
  }

  async findAll(): Promise<Empleado[]> {
    return this.empleadoRepository.find({
      where: { estado: true },
      relations: ['proyecto'],
    });
  }

  async findOne(id: number): Promise<Empleado | null> {
    return this.empleadoRepository.findOne({
      where: { id_empleado: id },
      relations: ['proyecto'],
    });
  }

  async update(
    id: number,
    updateEmpleadoDto: UpdateEmpleadoDto,
  ): Promise<Empleado> {
    const empleado = await this.empleadoRepository.findOne({
      where: { id_empleado: id },
    });
    if (!empleado) throw new NotFoundException('Empleado no encontrado');

    Object.assign(empleado, {
      nombre_empleado:
        updateEmpleadoDto.nombre_empleado ?? empleado.nombre_empleado,
      apellido_empleado:
        updateEmpleadoDto.apellido_empleado ?? empleado.apellido_empleado,
      puesto_empleado:
        updateEmpleadoDto.puesto_empleado ?? empleado.puesto_empleado,
      salario_empleado:
        updateEmpleadoDto.salario_empleado ?? empleado.salario_empleado,
      email_empleado:
        updateEmpleadoDto.email_empleado ?? empleado.email_empleado,
      telefono_empleado:
        updateEmpleadoDto.telefono_empleado ?? empleado.telefono_empleado,
      direccion_empleado:
        updateEmpleadoDto.direccion_empleado ?? empleado.direccion_empleado,
      fechaNacimiento:
        updateEmpleadoDto.fechaNacimiento ?? empleado.fechaNacimiento,
      estado: updateEmpleadoDto.estado ?? empleado.estado,
    });

    if (updateEmpleadoDto.proyectoId !== undefined) {
      if (updateEmpleadoDto.proyectoId === null) {
        empleado.proyecto = null;
      } else {
        const proyecto = await this.proyectoRepository.findOne({
          where: { id_proyecto: updateEmpleadoDto.proyectoId },
        });
        if (!proyecto) throw new NotFoundException('Proyecto no encontrado');
        empleado.proyecto = proyecto;
      }
    }

    return this.empleadoRepository.save(empleado);
  }

  async remove(id: number): Promise<void> {
    const empleado = await this.empleadoRepository.findOne({
      where: { id_empleado: id },
    });
    if (!empleado) throw new NotFoundException('Empleado no encontrado');
    empleado.estado = false;
    await this.empleadoRepository.save(empleado);
  }

  async asignarProyecto(
    idEmpleado: number,
    idProyecto: number,
  ): Promise<Empleado> {
    const empleado = await this.empleadoRepository.findOne({
      where: { id_empleado: idEmpleado },
      relations: ['proyecto'],
    });
    if (!empleado) throw new NotFoundException('Empleado no encontrado');
    if (empleado.proyecto && empleado.proyecto.id_proyecto === idProyecto) {
      throw new BadRequestException(
        'El empleado ya está asignado a este proyecto',
      );
    }
    const proyecto = await this.proyectoRepository.findOne({
      where: { id_proyecto: idProyecto },
    });
    if (!proyecto) throw new NotFoundException('Proyecto no encontrado');
    empleado.proyecto = proyecto;
    return this.empleadoRepository.save(empleado);
  }
}
