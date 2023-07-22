const express = require('express');
const router = express.Router();
const conn = require('./db/db');

router.get('/api/admin/getBoxOfficeByCinemaId',function(req,res) {
    let {
      price,
      cinemaId,
      movieName,
    } = req.body;
    let sqlStr = 'SELECT t_schedule.price,t_movie.movie_id,t_movie.`name`,t_cinema.cinema_name'+
                  'FROM t_order INNER JOIN t_schedule ON t_order.schedule_id = t_schedule.schedule_id INNER JOIN t_cinema ON t_schedule.cinema_id = t_cinema.cinema_id INNER JOIN t_movie ON t_schedule.movie_id = t_movie.movie_id ' +
                  'WHERE t_order.schedule_id = t_schedule.schedule_id AND t_schedule.cinema_id = t_cinema.cinema_id AND t_schedule.movie_id = t_movie.movie_id';
    conn.query(sqlStr,[1],(error,result,field) => {
      if(error) {
        console.log(error)
      } else {
        result = JSON.parse(JSON.stringify(result));
        console.log(result);
        res.json({success_code:200,data:result});
      }
    })             
  })