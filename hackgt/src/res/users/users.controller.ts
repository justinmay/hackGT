import { Controller, Post, Body, Get } from '@nestjs/common';
import { CreateUserDto } from "dto/createUser";
import { VerifyUserDto } from "dto/verifyUser";
import { UsersService } from 'svc/users/users.service';
import { UserModel } from 'model/user';


@Controller('users')
export class UsersController {

    constructor(private readonly usersService: UsersService) {}

    @Post()
    async createUser(@Body() createUserDto: CreateUserDto) : Promise<UserModel>{
        return this.usersService.createUser(createUserDto);
    }

    @Get() 
    verifyUser(@Body() verifyUserDto : VerifyUserDto) {
        this.usersService.verifyUser(verifyUserDto);
        return "Done."
    }
}
