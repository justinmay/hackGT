import { Controller, Post, Body, Get } from '@nestjs/common';
import { AppointmentModel } from 'model/appointment';
import { AppointmentsService } from 'svc/appointments/appointments.service';
import { CreateAppointmentDto } from 'dto/createAppointmentDto';

@Controller('appointments')
export class AppointmentsController {

    constructor(private readonly appointmentsService: AppointmentsService) {}


    @Post()
    async createUser(@Body() createAppointmentDto: CreateAppointmentDto) : Promise<AppointmentModel>{
        return this.appointmentsService.createAppointment(createAppointmentDto);
    }
}
