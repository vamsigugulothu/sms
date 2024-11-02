import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    try {
      const response = await this.$connect();
      console.log('Connection established');
    } catch (err) {
      console.log('Failed to connect to database', err);
    }
  }
}
