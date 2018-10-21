import { Injectable } from '@nestjs/common';
import { CreateAppointmentDto } from 'dto/createAppointmentDto';
import { GetScheduleDto } from 'dto/getSchedule';
import { AppointmentModel, Appointment } from 'model/appointment';

@Injectable()
export class AppointmentsService {
    createAppointment(createAppointmentDto : CreateAppointmentDto) : Promise<AppointmentModel> {
        const apptDoc = new Appointment(createAppointmentDto);
        return apptDoc.save();
    }

    async getAppointmentsByDoctor(getScheduleDto : GetScheduleDto) : Promise<AppointmentModel[]> {
        return Appointment.find({doctorid: getScheduleDto.doctorid}).exec();
    }
}
