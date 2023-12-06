-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "birth" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "document" TEXT NOT NULL,
    "freelancer" BOOLEAN NOT NULL,
    "active" BOOLEAN NOT NULL,
    "photo" BYTEA,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Service" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Service_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FreelancerService" (
    "id" TEXT NOT NULL,
    "idService" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,

    CONSTRAINT "FreelancerService_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_document_key" ON "User"("document");

-- AddForeignKey
ALTER TABLE "FreelancerService" ADD CONSTRAINT "FreelancerService_idService_fkey" FOREIGN KEY ("idService") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FreelancerService" ADD CONSTRAINT "FreelancerService_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
