import { user } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';

export class UserRepo {
  constructor(private prisma: PrismaService) {}
  async findById(id: number): Promise<user | null> {
    return await this.prisma.user.findUnique({
      where: { id: id },
    });
  }

  async findUserByEmail(email: string): Promise<user | null> {
    return await this.prisma.user.findUnique({
      where: { email: email },
    });
  }
}
