import { Document, Schema, Model, model} from "mongoose";

import { AppointmentInterface } from "./interfaces/appointment";

export interface AppointmentModel extends AppointmentInterface, Document {}

export var AppointmentSchema : Schema = new Schema({
    time: Date,
    location: String,
    userid: String,
    doctorid: String
});

AppointmentSchema.index({doctorid: 1, time: 1});
AppointmentSchema.index({location: 1, time: 1});

export const Appointment : Model<AppointmentModel> = model<AppointmentModel>("Appointment", AppointmentSchema);