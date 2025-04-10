import express from "express";
import likeRouter from "./res_like.router";
import rateRouter from "./res_rate.router";
import orderRouter from "./res_order.router";

const rootRouter = express.Router();

rootRouter.use("/res", likeRouter);
rootRouter.use("/res_rate", rateRouter);
rootRouter.use("/res_order", orderRouter);

export default rootRouter;