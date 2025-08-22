import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Proyecto } from './entities/proyecto.entity';
import { CreateProyectoDto } from './dto/create-proyecto.dto';
import { UpdateProyectoDto } from './dto/update-proyecto.dto';

@Injectable()
export class ProyectoService {
  constructor(
    @InjectRepository(Proyecto)
    private proyectoRepository: Repository<Proyecto>,
  ) {}

  create(createProyectoDto: CreateProyectoDto): Promise<Proyecto> {
    const proyecto = this.proyectoRepository.create(createProyectoDto);
    return this.proyectoRepository.save(proyecto);
  }

  async findAll(): Promise<Proyecto[]> {
    return this.proyectoRepository.find({
      where: { estado: 1 },
      relations: ['empleados'],
    });
  }

  findOne(id: number): Promise<Proyecto | null> {
    return this.proyectoRepository.findOne({
      where: { id_proyecto: id },
      relations: ['empleados'],
    });
  }

  async update(
    id: number,
    updateProyectoDto: UpdateProyectoDto,
  ): Promise<Proyecto> {
    const proyecto = await this.proyectoRepository.findOne({
      where: { id_proyecto: id },
    });
    if (!proyecto) throw new NotFoundException('Proyecto no encontrado');
    Object.assign(proyecto, updateProyectoDto);
    return this.proyectoRepository.save(proyecto);
  }

  async remove(id: number): Promise<void> {
    const proyecto = await this.proyectoRepository.findOne({
      where: { id_proyecto: id },
    });
    if (!proyecto) throw new NotFoundException('Proyecto no encontrado');
    proyecto.estado = 0;
    await this.proyectoRepository.save(proyecto);
  }
}
