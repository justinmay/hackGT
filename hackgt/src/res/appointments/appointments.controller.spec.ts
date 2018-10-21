import { Test, TestingModule } from '@nestjs/testing';
import { AppointmentsController } from './appointments.controller';

describe('Appointments Controller', () => {
  let module: TestingModule;
  beforeAll(async () => {
    module = await Test.createTestingModule({
      controllers: [AppointmentsController],
    }).compile();
  });
  it('should be defined', () => {
    const controller: AppointmentsController = module.get<AppointmentsController>(AppointmentsController);
    expect(controller).toBeDefined();
  });
});
