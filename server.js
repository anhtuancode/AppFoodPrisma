import express from 'express'
import rootRouter from './src/routers/root.router'

const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World')
})

app.use(express.json());
app.use(rootRouter);



app.listen(port, () => {
    console.log(`Server is running on PORT ${port}`);
});