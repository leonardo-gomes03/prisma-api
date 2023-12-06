import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export const UserController = {
  ListAll,
  Find,
  Create,
  Update,
  Delete,
};

async function VerifyEmail(email: string) {
  const user = await prismaClient.user.findFirst({
    where: {
      email: email,
    },
  });

  return !!user;
}

async function VerifyUsername(username: string) {
  const user = await prismaClient.user.findFirst({
    where: {
      username: username,
    },
  });

  return !!user;
}

async function ListAll(request: Request, response: Response) {
  const users = await prismaClient.user.findMany({ where: { active: true } });

  return response.json(users);
}

async function Find(request: Request, response: Response) {
  const { id } = request.params;

  const user = await prismaClient.user.findFirst({
    where: {
      id,
      active: true,
    },
  });

  return response.json(user);
}

async function Create(request: Request, response: Response) {
  const { document, birth, email, freelancer, name, username, id, photo } =
    request.body;

  // Verify Email
  const emailExists = await VerifyEmail(email);

  if (emailExists) {
    return response.status(422).json({ error: "Email already exists" });
  }

  // Verify Username
  const usernameExists = await VerifyUsername(username);

  if (usernameExists) {
    return response.status(422).json({ error: "Username already exists" });
  }

  const user = await prismaClient.user.create({
    data: {
      document,
      birth: new Date(birth),
      email,
      freelancer,
      name,
      username,
      id,
      photo,
    },
  });

  return response.json(user);
}

async function Update(request: Request, response: Response) {
  const { id } = request.params;
  const { active, document, birth, email, freelancer, name, username, photo } =
    request.body;

  const user = await prismaClient.user.update({
    where: {
      id,
    },
    data: {
      active,
      document,
      birth: new Date(birth),
      email,
      freelancer,
      name,
      username,
      photo,
    },
  });

  return response.json(user);
}

async function Delete(request: Request, response: Response) {
  const { id } = request.params;

  await prismaClient.user.update({
    where: {
      id,
    },
    data: {
      active: false,
    },
  });

  return response.status(204).send();
}
