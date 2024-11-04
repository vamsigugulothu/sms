import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async addNewUser(req: any, res: any) {
    console.log('check', req.body);
    const { name, role, email, age } = req.body;
    if (!role || !email) {
      return res
        .status(400)
        .send({ status_code: 400, message: 'role and email are required' });
    }

    const isUserExists = await this.prisma.user.findFirst({
      where: { email: email },
    });

    if (isUserExists) {
      return res
        .status(400)
        .send({ status_code: 400, message: 'email already exist' });
    }

    let newUser;
    if (role === 'student') {
      const newStudent = await this.prisma.student.create({
        data: { name: name, age: age },
      });
      newUser = await this.prisma.user.create({
        data: {
          name: name,
          role: role,
          email: email,
          student_link: newStudent.id,
        },
      });
    } else if (role === 'teacher') {
      const newTeacher = await this.prisma.teacher.create({
        data: { name: name, age: age },
      });
      newUser = await this.prisma.user.create({
        data: {
          name: name,
          role: role,
          email: email,
          teacher_link: newTeacher.id,
        },
      });
    }

    return res.status(200).send({ status_code: 200, data: newUser });
  }
  async getAllStudents(req: any, res: any) {
    const allStudetns = await this.prisma.student.findMany({
      include: {
        user: true,
      },
    });
    return res.status(200).send({ status_code: 200, data: allStudetns });
  }
}
