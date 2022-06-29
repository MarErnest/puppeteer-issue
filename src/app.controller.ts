import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import puppeteer from 'puppeteer';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  async getHello() {
    const browser = await puppeteer.launch({
      headless: true,
      args: ['--no-sandbox'],
    });
    const page = await browser.newPage();
    await page.goto('https://google.com');
    await page.screenshot({ path: 'google.png' });

    await browser.close();

    return {
      just: 'did a google screenshot',
    };
  }
}
