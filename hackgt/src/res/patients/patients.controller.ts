import { Controller, Post, Body, Get } from '@nestjs/common';
import { PatientDataModel } from 'model/patient-data';
import { InputPatientDataDto } from 'dto/inputPatientData';
import { NotifyDto } from 'dto/notify';
import { PatientsService } from 'svc/patients/patients.service';
import { SocketService } from 'svc/socket/socket.service';

@Controller('patients')
export class PatientsController {

    constructor(private readonly patientsService: PatientsService, 
                private readonly socketService : SocketService) {}

    @Post()
    async createUser(@Body() inputPatientDataDto: InputPatientDataDto) : Promise<PatientDataModel>{
        return this.patientsService.inputData(inputPatientDataDto);
    }

    @Post('/notify')
    notifyScreen(@Body() notifyDto : NotifyDto) {
        this.patientsService.getPatientData(notifyDto.userid).then((data) => {
            this.socketService.sendMessage(data);
        })
    }

    @Get('/notify')
    notifyScreenToClear() {
        this.socketService.sendMessage({clear: true});
    }
}
