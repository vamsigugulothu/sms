/*
  Warnings:

  - You are about to drop the `student` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "role" AS ENUM ('student', 'teacher', 'admin');

-- DropTable
DROP TABLE "student";

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200),
    "role" "role" NOT NULL DEFAULT 'student',
    "age" INTEGER,
    "enrollment_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "classroom_link" INTEGER,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classroom" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "classroom_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_classroom_link_key" ON "user"("classroom_link");

-- CreateIndex
CREATE UNIQUE INDEX "classroom_name_key" ON "classroom"("name");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_classroom_link_fkey" FOREIGN KEY ("classroom_link") REFERENCES "classroom"("id") ON DELETE SET NULL ON UPDATE CASCADE;
