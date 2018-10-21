import { Injectable } from '@nestjs/common';
import { emitMessage } from 'main';

@Injectable()
export class SocketService {
    socket = null;

    setio(myio) {
        this.socket = myio;
    }

    sendMessage(obj) {
        emitMessage(obj);
    }
}
