import { Controller, Get, Query, Req } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
// import { AppService } from './app.service';

@Controller()
export class UserController {
  constructor(private readonly prisma: PrismaService) {}

  @Get('students')
  getClassRoomUsers(@Req() req: Request) {
    // return this.appService.getClassRoomUsers();
    const response = this.prisma.user.findMany({
      where: {
        role: 'student',
      },
      include: {
        student: true,
      },
    });

    const res = this.prisma.student.findMany();
    console.log('response', response);
    return res;
  }
}
