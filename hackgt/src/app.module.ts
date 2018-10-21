import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersController } from './res/users/users.controller';
import { UsersService } from './svc/users/users.service';
import { AppointmentsController } from './res/appointments/appointments.controller';
import { AppointmentsService } from './svc/appointments/appointments.service';
import { PatientsController } from './res/patients/patients.controller';
import { PatientsService } from './svc/patients/patients.service';
import { SocketService } from './svc/socket/socket.service';

@Module({
  imports: [],
  controllers: [AppController, UsersController, AppointmentsController, PatientsController],
  providers: [AppService, UsersService, AppointmentsService, PatientsService, SocketService],
})
export class AppModule {}
