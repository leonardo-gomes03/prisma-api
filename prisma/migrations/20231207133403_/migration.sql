/*
  Warnings:

  - You are about to drop the column `idProject` on the `ratings` table. All the data in the column will be lost.
  - Added the required column `idRatedUser` to the `ratings` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ratings" DROP CONSTRAINT "ratings_idProject_fkey";

-- AlterTable
ALTER TABLE "ratings" DROP COLUMN "idProject",
ADD COLUMN     "idRatedUser" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "ratings" ADD CONSTRAINT "ratings_idRatedUser_fkey" FOREIGN KEY ("idRatedUser") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
