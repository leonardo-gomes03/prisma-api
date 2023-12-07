/*
  Warnings:

  - You are about to drop the column `idProjectCity` on the `projects` table. All the data in the column will be lost.
  - Added the required column `idCity` to the `projects` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_idProjectCity_fkey";

-- AlterTable
ALTER TABLE "projects" DROP COLUMN "idProjectCity",
ADD COLUMN     "idCity" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_idCity_fkey" FOREIGN KEY ("idCity") REFERENCES "project_cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
