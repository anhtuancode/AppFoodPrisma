import express, { Router } from "express";
import rateController from "../controllers/res_rate.controller";

const rateRouter = express.Router();

rateRouter.post("/add", rateController.add)
rateRouter.get("/getRateByRes/:id", rateController.getRateByRes)
rateRouter.get("/getRateByUser/:id", rateController.getRateByUser)

export default rateRouter;