import { responseSuccess } from "../common/helpers/response.helper";
import likeService from "../services/res_like.service";

const likeController = {
    like: async (req,res,next)=>{
        try {
            const result = await likeService.like(req);
            const response = responseSuccess(result, "Like restaurent successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    },
    getLike: async (req,res,next)=>{
        try {
            const result = await likeService.getLike(req);
            const response = responseSuccess(result, "Get user's like by restaurent id successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    },
    getLikeByUser: async (req,res,next)=>{
        try {
            const result = await likeService.getLikeByUser(req);
            const response = responseSuccess(result, "Get restaurent's like by user id successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    },
}

export default likeController;