import { Document, Schema, Model, model} from "mongoose";

import { PatientDataInterface } from "./interfaces/patient-data";

export interface PatientDataModel extends PatientDataInterface, Document { }

export var PatientDataSchema : Schema = new Schema({
    sex : String,
    dob : Date,
    allergies : [String],
    smoker : String,
    family :  [String],
    immunization : [String],
    result : String
});

PatientDataSchema.index({userid : 1});

export const PatientData : Model<PatientDataModel> = model<PatientDataModel>("PatientData", PatientDataSchema);