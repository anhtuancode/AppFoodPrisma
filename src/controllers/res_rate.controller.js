import { responseSuccess } from "../common/helpers/response.helper";
import rateService from "../services/res_rate.service";

const rateController = {
    add: async (req,res,next)=>{
        try {
            const result = await rateService.add(req);
            const response = responseSuccess(result, "Add review restaurant successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    },
    getRateByRes: async (req,res,next)=>{
        try {
            const result = await rateService.getRateByRes(req);
            const response = responseSuccess(result, "get user's review by restaurant successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    },
    getRateByUser: async (req,res,next)=>{
        try {
            const result = await rateService.getRateByUser(req);
            const response = responseSuccess(result, "get restaurant's review by user successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    },
}

export default rateController;