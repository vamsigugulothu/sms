-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_student_link_fkey";

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "student_link" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_student_link_fkey" FOREIGN KEY ("student_link") REFERENCES "student"("id") ON DELETE SET NULL ON UPDATE CASCADE;
