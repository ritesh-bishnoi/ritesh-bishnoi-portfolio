import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { join } from 'path';
import * as express from 'express';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // ✅ Get ConfigService instance
  const configService = app.get(ConfigService);

  // ✅ Enable CORS
  app.enableCors();

  // ✅ Global Validation
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
    }),
  );

  // Prefix for all API'S
  app.setGlobalPrefix('api');

  // ✅ Get PORT from .env via ConfigService
  const port = configService.get<number>('PORT') || 3000;

  app.use('/uploads', express.static(join(__dirname, '..', 'uploads')));

  await app.listen(port);
}
bootstrap();
