import { Controller, Post, Body, Get } from '@nestjs/common';
import { PatientDataModel } from 'model/patient-data';
import { InputPatientDataDto } from 'dto/inputPatientData';
import { PatientsService } from 'svc/patients/patients.service';

@Controller('patients')
export class PatientsController {

    constructor(private readonly patientsService: PatientsService) {}

    @Post()
    async createUser(@Body() inputPatientDataDto: InputPatientDataDto) : Promise<PatientDataModel>{
        return this.patientsService.inputData(inputPatientDataDto);
    }
}
