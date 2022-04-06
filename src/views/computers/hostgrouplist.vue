<template>
    <div style="height: 1000px">
         <div>
                <el-breadcrumb separator="/" style="margin:20px">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>服务器管理</el-breadcrumb-item>
                    <el-breadcrumb-item>主机组</el-breadcrumb-item>
                    
                </el-breadcrumb>
        </div>

   
        <el-card class="additem">
<!--                <i class="el-icon-plus icon-size"></i> 非空主机组-->
          主机组
        </el-card>
    <div  v-loading="loading" style="margin-top:30px">
         <div v-for="(data,index) in tableData" >
            <el-card class="item" v-show="data.count!=0">
                <div @click="toGroupList(data.groupid)" >
                    <div class="line">
                        <i class="el-icon-star-on icon-size" :style="{ color: Color(index) }"></i> 主机组ID：{{data.groupid}}
                    </div>
                    <div class="content">
                        主机组名：{{data.name}}
                    </div>
                    <div class="content">
                        主机总数：{{data.count}}
                    </div>
                </div>

            </el-card>
         </div>
</div>



        
        
    </div>
</template>

<script>
    import axios from "axios"
    export default {
        data() {
            return {
                group:5,
                loading:true,
                tableData:[]
            }
        },components:{
           
        },
        methods: {
            toGroupList(groupid){
                console.log(groupid);
                this.$router.push({
                    path: 'grouphosts',
                    query: {
                        groupid:groupid
                    }
                })
            },
            gethostlist(){
                axios.get("/monitor/groupinfo").then( res => {
                   console.log(res.data.res);
                   this.tableData=res.data.res;
                   this.loading=false
                })
            },
            Color(index){
                if(index%4==0){
                    return "##DCDFE6"
                }
                 if(index%4==1){
                    return "#606266"
                }
                 if(index%4==2){
                    return "#909399"
                }
                 if(index%4==3){
                    return "#C0C4CC"
                }


            }
  
        },mounted(){
           this.gethostlist();
        }
    }
</script>

<style scoped>

    .item{
        margin-left: 250px;
        margin-right: 250px;
        margin-top: 50px;
        height: 160px;
        color:rgb(119, 119, 119) ;
    }

    .additem{
        margin-left: 250px;
        margin-right: 250px;
        margin-top: 50px;
        height: 60px;
        color:rgb(177, 177, 177) ;
        text-align: center;
        font-size: 20px;
        line-height: 100%
    }
    .additem:hover{
        color: white;
        background-color: rgb(230, 230, 230);
        cursor: pointer;
    }
    .line{
        height:30px;
        border: none;
        border-bottom: 1px solid rgb(230, 230, 230)  ;
        font-size: 20px;
        line-height: 30px;
    }
    .content{
        margin-top: 20px;
    }
   .item:hover{
        color: white;
        background-color: rgb(220, 220, 220);
        cursor: pointer;
        opacity: 0.8;
   }
 
</style>
