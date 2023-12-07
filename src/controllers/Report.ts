import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export const ReportController = {
  ListAll,
  Find,
  Create,
  Update,
  Delete,
};

async function ListAll(request: Request, response: Response) {
  const reports = await prismaClient.report.findMany();

  return response.json(reports);
}

async function Find(request: Request, response: Response) {
  const { id } = request.params;

  const report = await prismaClient.report.findFirst({
    where: {
      id,
    },
  });

  return response.json(report);
}

async function Create(request: Request, response: Response) {
  const { message, idUser, idProject } = request.body;

  const report = await prismaClient.report.create({
    data: {
      message,
      idUser,
      idProject,
    },
  });

  return response.json(report);
}

async function Update(request: Request, response: Response) {
  const { id } = request.params;
  const { message, idUser, idProject } = request.body;

  const report = await prismaClient.report.update({
    where: {
      id,
    },
    data: {
      message,
      idUser,
      idProject,
    },
  });

  return response.json(report);
}

async function Delete(request: Request, response: Response) {
  const { id } = request.params;

  await prismaClient.report.delete({
    where: {
      id,
    },
  });

  return response.status(204).send();
}
