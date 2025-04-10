import express from "express"
import orderController from "../controllers/res_order.controller";

const orderRouter = express.Router();

orderRouter.post("/add", orderController.add)

export default orderRouter;