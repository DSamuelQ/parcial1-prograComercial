import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Proyecto } from './entities/proyecto.entity';
import { ProyectoService } from './proyecto.service';
import { ProyectoController } from './proyecto.controller';
import { Empleado } from '../empleado/entities/empleado.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Proyecto, Empleado])],
  controllers: [ProyectoController],
  providers: [ProyectoService],
  exports: [ProyectoService],
})
export class ProyectoModule {}
