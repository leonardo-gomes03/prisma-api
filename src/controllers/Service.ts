import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export const ServiceController = {
  ListAll,
  Create,
};

async function ListAll(request: Request, response: Response) {
  const services = await prismaClient.service.findMany();

  return response.json(services);
}

async function Create(request: Request, response: Response) {
  const { name } = request.body;

  const service = await prismaClient.service.create({
    data: {
      name,
    },
  });

  return response.json(service);
}
