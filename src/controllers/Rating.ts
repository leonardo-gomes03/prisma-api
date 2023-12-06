// import { Request, Response } from "express";
// import { prismaClient } from "../database/prismaClient";

// export const RatingController = {
//   ListAll,
// };

// async function ListAll(request: Request, response: Response) {
//   const ratings = await prismaClient.rating.findMany({
//     include: {
//       User: {
//         select: {
//           name: true,
//           photo: true,
//         },
//       },
//       Project: {
//         select: {
//           User: true,
//           nomeusuario: true,
//           username: true,
//         },
//         include: {
//           ProjectProposal: true,
//         },
//       },
//     },
//   });

//   return response.json(ratings);
// }
