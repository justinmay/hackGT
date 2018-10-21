import { Test, TestingModule } from '@nestjs/testing';
import { PatientsController } from './patients.controller';

describe('Patients Controller', () => {
  let module: TestingModule;
  beforeAll(async () => {
    module = await Test.createTestingModule({
      controllers: [PatientsController],
    }).compile();
  });
  it('should be defined', () => {
    const controller: PatientsController = module.get<PatientsController>(PatientsController);
    expect(controller).toBeDefined();
  });
});
