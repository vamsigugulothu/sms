import { Controller, Get, Query, Req } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): Array<any> {
    return [1, 2, 3];
    // this.appService.getHello();
  }

  @Get('/api')
  getApp(@Query('id') id: string, @Req() req: Request): any {
    console.log('id', id);
    return { id: 'VAMSI' };
  }
}
