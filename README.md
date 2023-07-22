# 淘气电影

> ### 淘气电影后台管理项目

## 预览

<img src="https://img-blog.csdnimg.cn/2019092514452441.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MTM4MjE4Nw==,size_16,color_FFFFFF,t_70" width="600px">

## 目录

    |-- .gitignore  #git中忽略的文件
    |-- index.html  #根文件
    |-- package.json  #项目描述文件
    |-- README.md  #项目介绍文件
    |-- build  #webpack开发和打包的配置文件
    |-- config  #vue-cli的配置文件
    |-- src  #资源文件夹
    |   |-- App.vue  #页面入口文件
    |   |-- main.js  #程序入口文件
    |   |-- api  #请求接口文件
    |   |   |-- ajax.js  #基于axios封装ajax文件
    |   |   |-- index.js  #调用接口文件
    |   |-- common  #公共资源文件
    |   |   |-- css
    |   |       |-- style.css  #字体图标样式文件
    |   |       |-- fonts  #字体图标文件
    |   |-- components  #组件文件
    |   |-- pages  #页面文件
    |   |   |-- Home  #主页
    |   |   |   |-- Home.vue
    |   |   |   |-- children
    |   |   |       |-- CinemaManage.vue  #影院管理页
    |   |   |       |-- CommentManage.vue  #评论管理页
    |   |   |       |-- HallManage.vue  #影厅管理页
    |   |   |       |-- MovieManage.vue  #电影管理页
    |   |   |       |-- MovieSchedule.vue  #电影排片页
    |   |   |       |-- OrderManage.vue  #订单管理页
    |   |   |       |-- UserManage.vue  #用户管理页
    |   |   |-- Login  #登录页
    |   |       |-- Login.vue
    |   |-- router  #路由
    |       |-- index.js  #路由配置
    |-- static  #静态文件
        |-- css
            |-- reset.css  #兼容性样式

## 收获：

制作BoxOffice.vue页面让我受益匪浅。这是我第一次使用echarts搭建图表。其中包括了后台数据的获取、前台数据的提取以及图表的动态数据绑定。

我之前只尝试到了获取后台数据。最终使用的数据只用到两项：电影名和总的票房数据。但是这两项数据需要从四五个数据表中获取，尤其是总票房数据需要计算。我早把mysql的知识忘得差不多了。因此只能边学边试，直到后来也是难以得到想要的结果。只能退而求其次，把所有的数据都拿到后台。这样做无疑会拖慢系统的运行时间，但至少在可接受的范围之内。

前台数据的提取，并不是一件难事。其中一个隐藏的知识点才是最重要的。这个难题，一直到昨晚我才意识到，今天才能解决。假如我意识不到这个问题，到现在我都不能解决这个问题。

```js
obj = json.data.map((item,index) => {
              return Object.assign({},{'name':item.name,'value':item.ticket_total_price})
             });
```

我在提取数据中使用了push方法，这样做导致最终获得的数据一直呈现出__ob__:Observer的情况(一个对象数组，push进去对象的话)。最终我才知道vue中出现这个是 Vue 框架对数据设置的监控器，一般是 `不可以被枚举` 的。获取这种样式的数据只会返回undefined。

感谢这位大佬的解答，帮到我很多。https://blog.csdn.net/qq_60353088/article/details/125580345

解决方法也很简单，加上我是异步获取到的数据，如果不能保证事件发生的次序也会出现突如其来的问题。干脆把数据提取的工作放到数据返回之后。

```js
let json = await getBoxOfficeByCinemaId()
        setTimeout(() => {
            if(json.success_code==200) {
            console.log(json.data);
            this.arr = json.data;
            obj = json.data.map((item,index) => {
               return Object.assign({},{'name':item.name,'value':item.ticket_total_price})
             });
```

我是用的是Object.assign()  方法，https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign。

> `Object.assign()` 方法只会拷贝源对象*可枚举的*的*自有属性*到目标对象。该方法在源对象上使用 `[[Get]]`，在目标对象上使用 `[[Set]]`，因此它会调用 [getter](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/get) 和 [setter](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/set)。故它对属性进行*赋值*，而不仅仅是复制或定义新的属性。如果要合并的源对象包含 getter，这可能使其不适合将新属性合并到原型中。

可以学习到的是，Object.assign(),通常是处理多个对象。

Object.assign({},{'name':item.name,'value':item.ticket_total_price})	这种样式的方法可以把一个对象数组的数据，提取其中的几个属性。这个方法真得很好

处理图表的动态数据绑定并不是一件很困难的事情，问题出在我没有学过Echarts，我拿的是别人用的模板。而且我要处理好其他的事项，尤其是数据提取的大问题和动态数据绑定纠缠在一起，我昨天下午直接生气到不能自已。还好我坚持了锻炼的习惯，成功排解了问题。我可真厉害。

问题出在EchartInit()函数是在mounted阶段发生的，这个时间直接执行了图表渲染。如果后续要做重新渲染，需要使用vue的watch方法，把Echart的option配置项进行深度监听。这样子才可以做到动态渲染。还有一种方法是在生成ChartDOM节点之前，给他做v-if判断。但这两种方法我都不熟悉，因而放弃。

我选择删除掉mounted阶段的EchartInit()方法。直接在获取数据、提取数据之后就执行图表渲染。如果我曾经学习过Echarts，这本来是一件很容易想到的事情，好在我使用了正确的做事方法，坚持了正确的行为习惯，才可以在不熟悉的领域发现问题、解决问题。我真TM棒。

```js
  	var Chart_ = echarts.init(document.getElementById('main'))
    var option = {  ............   }
    Chart_.setOption(option)
```

组件BoxOffice.vue的源码如下：

```vue
<template>
    <div style="width: auto;height: 800px" id="main">
    </div>
  </template>
  
  <script>
  import {getBoxOfficeByCinemaId} from "../../../api"
  import * as echarts from 'echarts'
  //通过this.$echarts来使用
    export default {
      name: "BoxOffice",
      data() {
                return {          
                    Cost: [],
                    arr:[],
                };
            },
      created() {
        this.loadBoxOffice();
        console.log('this.newarr-created',this.newarr)
      },
    //   mounted(){
    //       // 在通过mounted调用即可
    //       setTimeout(()=>{
    //         this.echartsInit()
    //       })
         
    //   },
      methods: {
        async loadBoxOffice(){
            var obj=[];
            var newarr=[];
            var movieName =[];
            let json = await getBoxOfficeByCinemaId()

            setTimeout(()=>{
                console.log('json.data',json.data)
            json.data.forEach(item => {
                obj.push({'value':item.ticket_total_price,'name':item.name})
            });
            console.log('obj',obj)
            // this.arr = this.sum(obj)

            // console.log('arr',this.arr)
            // if(json.success_code==200) {
            //     let res = json.data.map((item,index) => {
            //         return Object.assign({},{'name':item.name,'value':item.ticket_total_price})
            //     });
            //     console.log('res',res);
            //     this.arr = res;

                if (obj.length > 0) {
                    var ayy=[];
                    for (let item of obj) {
                        ayy.push(item.name);
                    }
                    movieName=this.removeDuplicate(ayy);
                    console.log( movieName)
                }
            // }
            newarr = this.sum(obj)
            console.log('newarr',newarr)

            // 设置重新渲染的条件
            var Chart_ = echarts.init(document.getElementById('main'))
            var option = {
                legend: {
                        // 图例
                        data: movieName,
                        left: "5%",
                        top: "5%",
                        orient: "vertical"
                    },
                    toolbox: {
                        show: true,
                        feature: {
                        mark: { show: true },
                        dataView: { show: true, readOnly: false },
                        restore: { show: true },
                        saveAsImage: { show: true }
                        },
                    },
                    title: {
                        // 设置饼图标题，位置设为顶部居中
                        text: "中影数字影城票房统计饼状图",
                        top: "0%",
                        left: "center"
                    },
                    series: [
                        {
                            type: "pie",
                            label: {
                                show: true,
                                formatter: "{b} : {c} ({d}%)" // b代表名称，c代表对应值，d代表百分比
                            },
                            data: newarr ,
                        }
                    ]
            }
            Chart_.setOption(option)
            })

            



        },

         // 删除重复数据，并根据电影名累加总票房数据，将结果返回
         sum(res) {
			var result = [];
			var newData = res;
			var delData = [];
			data1:
				for (var i in res) {
					var json = res[i];
					var countAmt = res[i].value;
					var number = 1;
					data2:
						for (var j in newData) {
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
							if (i != j && res[i].name == newData[j].name ) {
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
            return arr.indexOf(item) === index
        })
        },

        // 图表数据配置
            optionPieChart(msg,name) {
                let pieChartData = 
                {
                    legend: {
                        // 图例
                        data: name,
                        right: "5%",
                        top: "5%",
                        orient: "vertical"
                    },
                    toolbox: {
                        show: true,
                        feature: {
                        mark: { show: true },
                        dataView: { show: true, readOnly: false },
                        restore: { show: true },
                        saveAsImage: { show: true }
                        },
                    },
                    title: {
                        // 设置饼图标题，位置设为顶部居中
                        text: "中影数字影城票房统计饼状图",
                        top: "0%",
                        left: "center"
                    },
                    series: [
                        {
                            type: "pie",
                            label: {
                                show: true,
                                formatter: "{b} : {c} ({d}%)" // b代表名称，c代表对应值，d代表百分比
                            },
                            data: msg ,
                        }
                    ]
                };
                return pieChartData;
            },

          //初始化echarts 
          echartsInit() {

              //因为初始化echarts 的时候，需要指定的容器 id='main'
                console.log('this.newarr-mounted',this.newarr)
                var Chart = echarts.init(document.getElementById('main'))
                let option =  this.optionPieChart(this.newarr,this.movieName)
                Chart.setOption(option,true)
           
          }
        } 
    }
  </script>
  
```

