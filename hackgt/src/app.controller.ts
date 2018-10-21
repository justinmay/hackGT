import { Get, Controller, Response } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  root(@Response() res) {
    res.sendFile(__dirname + "/screen.html")
  }
}
