import { Controller, Get, Post, Req, Res } from '@nestjs/common';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  //   constructor(private readonly UserService: UserService) {}
  constructor(private readonly userService: UserService) {}
  @Post('addUser')
  addNewUser(@Req() req: Request, @Res() res: Response) {
    return this.userService.addNewUser(req, res);
  }

  @Get('students')
  getAllStudents(@Req() req: Request, @Res() res: Response) {
    return this.userService.getAllStudents(req, res);
  }
}
