import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EmpleadoModule } from './empleado/empleado.module';
import { ProyectoModule } from './proyecto/proyecto.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: '',
      database: 'rrhh',
      autoLoadEntities: true,
      synchronize: true,
    }),
    EmpleadoModule,
    ProyectoModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
