import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export const ProjectTypeController = {
  ListAll,
  Create,
};

async function ListAll(request: Request, response: Response) {
  const projectTypes = await prismaClient.projectType.findMany();

  return response.json(projectTypes);
}

async function Create(request: Request, response: Response) {
  const { name } = request.body;

  const projectType = await prismaClient.projectType.create({
    data: {
      name,
    },
  });

  return response.json(projectType);
}
