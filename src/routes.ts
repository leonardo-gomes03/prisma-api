import { Router } from "express";
import { UserController } from "./controllers/User";
import { ProjectTypeController } from "./controllers/ProjectType";
import { ProjectController } from "./controllers/Project";
import { ServiceController } from "./controllers/Service";
import { ReportController } from "./controllers/Report";

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

//Report
router.get("/report", ReportController.ListAll);
router.get("/report/:id", ReportController.Find);
router.post("/report", ReportController.Create);
router.put("/report/:id", ReportController.Update);
router.delete("/report/:id", ReportController.Delete);

//Project
router.get("/project", ProjectController.ListAll);
router.get("/project/:id", ProjectController.Find);
router.post("/project", ProjectController.Create);
router.put("/project/:id", ProjectController.Update);
// router.delete("/project/:id", ProjectController.Delete);

export { router };
