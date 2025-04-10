import { responseSuccess } from "../common/helpers/response.helper";
import orderService from "../services/res_order.service";

const orderController = {
    add: async (req,res,next) =>{
        try {
            const result = await orderService.add(req);
            const response = responseSuccess(result, "Add rate restaurant successfully");
            res.status(response.statusCode).json(response);
        } catch (error) {
            next(error);
        }
    }
}

export default orderController;