import { Router } from "express";
import { UserController } from "./controllers/User";
import { ProjectTypeController } from "./controllers/ProjectType";
import { ServiceController } from "./controllers/Service";

const router = Router();

// User
router.get("/user", UserController.ListAll);
router.get("/user/:id", UserController.Find);
router.post("/user", UserController.Create);
router.put("/user/:id", UserController.Update);
router.delete("/user/:id", UserController.Delete);

// ProjectType
router.get("/projecttype", ProjectTypeController.ListAll);

//Service
router.get("/service", ServiceController.ListAll);
router.post("/service", ServiceController.Create);

export { router };
