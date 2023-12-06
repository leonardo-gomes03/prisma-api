/*
  Warnings:

  - You are about to drop the `FreelancerService` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Project` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectCity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectProposal` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectService` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rating` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Report` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Service` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "FreelancerService" DROP CONSTRAINT "FreelancerService_idService_fkey";

-- DropForeignKey
ALTER TABLE "FreelancerService" DROP CONSTRAINT "FreelancerService_idUser_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_idProjectCity_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_idProjectType_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_idUser_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProposal" DROP CONSTRAINT "ProjectProposal_idProject_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProposal" DROP CONSTRAINT "ProjectProposal_idService_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProposal" DROP CONSTRAINT "ProjectProposal_idUser_fkey";

-- DropForeignKey
ALTER TABLE "ProjectService" DROP CONSTRAINT "ProjectService_idProject_fkey";

-- DropForeignKey
ALTER TABLE "ProjectService" DROP CONSTRAINT "ProjectService_idService_fkey";

-- DropForeignKey
ALTER TABLE "Rating" DROP CONSTRAINT "Rating_idProject_fkey";

-- DropForeignKey
ALTER TABLE "Rating" DROP CONSTRAINT "Rating_idUser_fkey";

-- DropForeignKey
ALTER TABLE "Report" DROP CONSTRAINT "Report_idProject_fkey";

-- DropForeignKey
ALTER TABLE "Report" DROP CONSTRAINT "Report_idUser_fkey";

-- DropTable
DROP TABLE "FreelancerService";

-- DropTable
DROP TABLE "Project";

-- DropTable
DROP TABLE "ProjectCity";

-- DropTable
DROP TABLE "ProjectProposal";

-- DropTable
DROP TABLE "ProjectService";

-- DropTable
DROP TABLE "ProjectType";

-- DropTable
DROP TABLE "Rating";

-- DropTable
DROP TABLE "Report";

-- DropTable
DROP TABLE "Service";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "birth" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "document" TEXT NOT NULL,
    "freelancer" BOOLEAN NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "photo" BYTEA,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "services" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "freelancer_services" (
    "id" TEXT NOT NULL,
    "idService" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,

    CONSTRAINT "freelancer_services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_types" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "project_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_cities" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "project_cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "projects" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idProjectType" TEXT NOT NULL,
    "idProjectCity" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_services" (
    "id" TEXT NOT NULL,
    "idService" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,

    CONSTRAINT "project_services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_proposals" (
    "id" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idService" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "message" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "project_proposals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ratings" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ratings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reports" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "reports_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_document_key" ON "users"("document");

-- AddForeignKey
ALTER TABLE "freelancer_services" ADD CONSTRAINT "freelancer_services_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "freelancer_services" ADD CONSTRAINT "freelancer_services_idService_fkey" FOREIGN KEY ("idService") REFERENCES "services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_idProjectType_fkey" FOREIGN KEY ("idProjectType") REFERENCES "project_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_idProjectCity_fkey" FOREIGN KEY ("idProjectCity") REFERENCES "project_cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_services" ADD CONSTRAINT "project_services_idService_fkey" FOREIGN KEY ("idService") REFERENCES "services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_services" ADD CONSTRAINT "project_services_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_proposals" ADD CONSTRAINT "project_proposals_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_proposals" ADD CONSTRAINT "project_proposals_idService_fkey" FOREIGN KEY ("idService") REFERENCES "services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_proposals" ADD CONSTRAINT "project_proposals_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ratings" ADD CONSTRAINT "ratings_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ratings" ADD CONSTRAINT "ratings_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
