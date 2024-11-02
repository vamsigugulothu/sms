/*
  Warnings:

  - Made the column `student_link` on table `user` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "user" ALTER COLUMN "student_link" SET NOT NULL;
