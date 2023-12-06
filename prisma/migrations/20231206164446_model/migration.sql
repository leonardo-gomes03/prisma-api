-- CreateTable
CREATE TABLE "ProjectType" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProjectType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectCity" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProjectCity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idProjectType" TEXT NOT NULL,
    "idProjectCity" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectService" (
    "id" TEXT NOT NULL,
    "idService" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,

    CONSTRAINT "ProjectService_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectProposal" (
    "id" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idService" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "message" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProjectProposal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rating" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Report" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idProject" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Report_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_idProjectType_fkey" FOREIGN KEY ("idProjectType") REFERENCES "ProjectType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_idProjectCity_fkey" FOREIGN KEY ("idProjectCity") REFERENCES "ProjectCity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectService" ADD CONSTRAINT "ProjectService_idService_fkey" FOREIGN KEY ("idService") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectService" ADD CONSTRAINT "ProjectService_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProposal" ADD CONSTRAINT "ProjectProposal_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProposal" ADD CONSTRAINT "ProjectProposal_idService_fkey" FOREIGN KEY ("idService") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProposal" ADD CONSTRAINT "ProjectProposal_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
