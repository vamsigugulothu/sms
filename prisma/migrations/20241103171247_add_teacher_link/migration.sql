/*
  Warnings:

  - A unique constraint covering the columns `[teacher_link]` on the table `user` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "subject" AS ENUM ('english', 'science', 'maths', 'unknown');

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "teacher_link" INTEGER;

-- CreateTable
CREATE TABLE "teacher" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200),
    "age" INTEGER,
    "subject" "subject" NOT NULL DEFAULT 'unknown',

    CONSTRAINT "teacher_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_teacher_link_key" ON "user"("teacher_link");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_teacher_link_fkey" FOREIGN KEY ("teacher_link") REFERENCES "teacher"("id") ON DELETE SET NULL ON UPDATE CASCADE;
