import express from "express";
import likeController from "../controllers/res_like.controller";

const likeRouter = express.Router();

likeRouter.post("/like", likeController.like)
likeRouter.get("/getLike/:id", likeController.getLike)
likeRouter.get("/getLikeByUser/:id", likeController.getLikeByUser)



export default likeRouter;