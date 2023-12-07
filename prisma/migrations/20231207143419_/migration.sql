/*
  Warnings:

  - You are about to drop the `project_cities` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_idCity_fkey";

-- DropTable
DROP TABLE "project_cities";

-- CreateTable
CREATE TABLE "cities" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_idCity_fkey" FOREIGN KEY ("idCity") REFERENCES "cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
