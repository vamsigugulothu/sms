/*
  Warnings:

  - You are about to drop the column `age` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `classroom_link` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `enrollment_date` on the `user` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[student_link]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `student_link` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_classroom_link_fkey";

-- DropIndex
DROP INDEX "user_classroom_link_key";

-- AlterTable
ALTER TABLE "user" DROP COLUMN "age",
DROP COLUMN "classroom_link",
DROP COLUMN "enrollment_date",
ADD COLUMN     "student_link" INTEGER;

-- CreateTable
CREATE TABLE "student" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200),
    "age" INTEGER,
    "enrollment_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_student_link_key" ON "user"("student_link");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_student_link_fkey" FOREIGN KEY ("student_link") REFERENCES "student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
