import { Document, Schema, Model, model} from "mongoose";

import { UserInterface } from "./interfaces/user";
import { PatientData, PatientDataModel } from "./patient-data";
import { Appointment, AppointmentModel } from "./appointment";

export interface UserModel extends UserInterface, Document {
    isPatient() : Boolean;
    getPatientData(): Promise<PatientDataModel>;
    getAppointmentSchedule() : Promise<AppointmentModel[]>;
}

export var UserSchema: Schema = new Schema({
    firstName: String,
    lastName: String,
    type: String
});

UserSchema.index({type: 1});

UserSchema.methods.isPatient = function() : Boolean {
    return this.type == "patient";
}

UserSchema.methods.getPatientData = async function() : Promise<PatientDataModel> {
    return PatientData.findById(this._id).exec();
}

UserSchema.methods.getAppointmentSchedule = function(): Promise<AppointmentModel[]> {
    return Appointment.find({userid: this._id}).exec();
}

export const User : Model<UserModel> = model<UserModel>("User", UserSchema);