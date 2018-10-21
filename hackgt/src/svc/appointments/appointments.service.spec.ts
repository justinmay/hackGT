import { Test, TestingModule } from '@nestjs/testing';
import { AppointmentsService } from './appointments.service';

describe('AppointmentsService', () => {
  let service: AppointmentsService;
  beforeAll(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AppointmentsService],
    }).compile();
    service = module.get<AppointmentsService>(AppointmentsService);
  });
  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
