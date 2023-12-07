import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export const ProjectController = {
  ListAll,
  Find,
  Create,
  Update,
};

async function ListAll(request: Request, response: Response) {
  const projects = await prismaClient.project.findMany();

  return response.json(projects);
}

async function Find(request: Request, response: Response) {
  const { id } = request.params;

  const project = await prismaClient.project.findFirst({
    where: {
      id,
    },
  });

  return response.json(project);
}

async function Create(request: Request, response: Response) {
  const { description, title, idUser, idCity, idProjectType } = request.body;

  const project = await prismaClient.project.create({
    data: {
      description,
      title,
      createdAt: new Date(),
      startDate: new Date(),
      endDate: new Date(),
      idUser,
      idCity,
      idProjectType,
    },
  });

  return response.json(project);
}

async function Update(request: Request, response: Response) {
  const { id } = request.params;
  const { description, title, idUser, idCity, idProjectType } = request.body;

  const project = await prismaClient.project.update({
    where: {
      id,
    },
    data: {
      description,
      title,
      idUser,
      idCity,
      idProjectType,
    },
  });

  return response.json(project);
}
