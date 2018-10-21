import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as socketio from 'socket.io';

import * as mongoose from "mongoose";

function setUpMongoDB(host : String, port: Number, database : String) {
  (<any>mongoose).Promise = global.Promise;
  mongoose.connect(host + ":" + port + "/" + database, function(error) {
    if (error) console.log(error);
  });
}

var socket = null;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const io = socketio(app);
  io.on('connection', function(sock) {
    socket = sock;
  })

  setUpMongoDB("mongodb://localhost", 27017, "hackgt");

  await app.listen(3000);
}

export function emitMessage(obj) {
  socket.emit('data', obj);
}

bootstrap();
