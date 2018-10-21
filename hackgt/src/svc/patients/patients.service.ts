import { Injectable } from '@nestjs/common';
import { InputPatientDataDto } from 'dto/inputPatientData';
import { PatientDataModel, PatientData } from 'model/patient-data';

@Injectable()
export class PatientsService {
    inputData(inputPatientDataDto : InputPatientDataDto) : Promise<PatientDataModel> {
        const dataDoc = new PatientData(inputPatientDataDto);
        return dataDoc.save();
    }

    getPatientData(userid : String) : Promise<PatientDataModel> {
        return PatientData.findOne({userid: userid}).exec();
    }

}
