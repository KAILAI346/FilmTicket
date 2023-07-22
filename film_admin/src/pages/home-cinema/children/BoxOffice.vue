<template>
  <div style="width: auto; height: 800px" id="main"></div>
</template>

<script>
import { getBoxOfficeByCinemaId } from "../../../api";
import * as echarts from "echarts";
//通过this.$echarts来使用
export default {
  name: "BoxOffice",
  data() {
    return {
      Cost: [],
      arr: [],
    };
  },
  created() {
    this.loadBoxOffice();
    console.log("this.newarr-created", this.newarr);
  },
  methods: {
    async loadBoxOffice() {
      var obj = [];
      var newarr = [];
      var movieName = [];
      let json = await getBoxOfficeByCinemaId();
      setTimeout(() => {
        json.data.forEach((item) => {
          obj.push({ value: item.ticket_total_price, name: item.name });
        });

        if (obj.length > 0) {
          var ayy = [];
          for (let item of obj) {
            ayy.push(item.name);
          }
          movieName = this.removeDuplicate(ayy);
          console.log(movieName);
        }
        newarr = this.sum(obj);
        // 设置重新渲染的条件
        var Chart_ = echarts.init(document.getElementById("main"));
        var option = {
          legend: {
            // 图例
            data: movieName,
            left: "5%",
            top: "5%",
            orient: "vertical",
          },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: false },
              restore: { show: true },
              saveAsImage: { show: true },
            },
          },
          title: {
            // 设置饼图标题，位置设为顶部居中
            text: "中影数字影城票房统计饼状图",
            top: "0%",
            left: "center",
          },
          series: [
            {
              type: "pie",
              label: {
                show: true,
                formatter: "{b} : {c} ({d}%)", // b代表名称，c代表对应值，d代表百分比
              },
              data: newarr,
            },
          ],
        };
        Chart_.setOption(option);
      });
    },
    // 删除重复数据，并根据电影名累加总票房数据，将结果返回
    sum(res) {
      var result = [];
      var newData = res;
      var delData = [];
      data1: for (var i in res) {
        var json = res[i];
        var countAmt = res[i].value;
        var number = 1;
        data2: for (var j in newData) {
          if (delData != null) {
            for (var h in delData) {
              if (i == delData[h]) {
                continue data1;
              }
              if (j == delData[h]) {
                continue data2;
              }
            }
          }
          if (i != j && res[i].name == newData[j].name) {
            delData.push(j);
            number++;
            countAmt += newData[j].value;
          }
        }
        json.value = countAmt;
        result.push(json);
      }
      console.log(result);
      return result;
    },
    // 数组去重
    removeDuplicate(arr) {
      return arr.filter((item, index) => {
        return arr.indexOf(item) === index;
      });
    },
  },
};
</script>
