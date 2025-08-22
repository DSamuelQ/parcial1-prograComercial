import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Empleado } from './entities/empleado.entity';
import { EmpleadoService } from './empleado.service';
import { EmpleadoController } from './empleado.controller';
import { Proyecto } from '../proyecto/entities/proyecto.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Empleado, Proyecto])],
  controllers: [EmpleadoController],
  providers: [EmpleadoService],
  exports: [EmpleadoService],
})
export class EmpleadoModule {}
