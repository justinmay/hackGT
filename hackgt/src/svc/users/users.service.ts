import { Injectable } from '@nestjs/common';
import { CreateUserDto } from 'dto/createUser';
import { UserModel, User } from 'model/user';
import { VerifyUserDto } from 'dto/verifyUser';
import { Appointment } from 'model/appointment';

import * as request from 'request';

@Injectable()
export class UsersService {

    lightURL : String = "";

    createUser(createUserDto : CreateUserDto) : Promise<UserModel> {
        const userDoc = new User(createUserDto);
        return userDoc.save();
    }

    verifyUser(verifyUserDto : VerifyUserDto) {
        this.checkPermissions(verifyUserDto.room, verifyUserDto.userid).then(function(allowed) {
            request({
                url: this.lightURL,
                method: "POST",
                json: true,
                body: {
                    allowed: allowed
                }
            }, function(err, res, body) { })
        })
    }

    checkPermissions(room : String, userid : String) : Promise<Boolean> {
        return new Promise((resolve, reject) => {
            Appointment.find({location: room}, function(err, res) {
                if (res[0].userid == userid) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            })
        });
    }

}
