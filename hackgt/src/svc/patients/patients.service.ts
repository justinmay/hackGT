import { Injectable } from '@nestjs/common';
import { InputPatientDataDto } from 'dto/inputPatientData';
import { PatientDataModel, PatientData } from 'model/patient-data';
import { User } from 'model/user';

@Injectable()
export class PatientsService {
    inputData(inputPatientDataDto : InputPatientDataDto) : Promise<PatientDataModel> {
        const dataDoc = new PatientData(inputPatientDataDto);
        return dataDoc.save();
    }

    getPatientData(userid : String) : Promise<any> {
        return new Promise(function(resolve, reject) {
            PatientData.findOne({userid: userid}).then((data) => {
                User.findById(userid, (err, user) => {
                    var stuff = JSON.parse(JSON.stringify(data))
                    console.log(user.firstName)
                    stuff["firstName"] = user.firstName;
                    console.log(stuff);
                    stuff["lastName"] = user.lastName;
                    resolve(stuff);
                })
            })
        });
    }

}
