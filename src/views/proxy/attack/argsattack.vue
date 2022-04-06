<template>
<div>
     <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>数据库管理</el-breadcrumb-item>
                    <el-breadcrumb-item>网络防火墙</el-breadcrumb-item>
                    <el-breadcrumb-item>参数异常攻击</el-breadcrumb-item>
        </el-breadcrumb>
    <div class="search-box">
        <el-card >
              
            <el-row :gutter="50">
                <el-col :span="8">  
                    <span class="filter_span">开始日期</span> 
                    <el-date-picker
                        v-model="startDate"
                        type="date"
                        placeholder="选择日期"
                        style="width:70%">
                    </el-date-picker>
                </el-col>
                <el-col :span="8">
                    <span class="filter_span">结束日期</span>
                    <el-date-picker
                        v-model="endDate"
                        type="date"
                        placeholder="选择日期"
                        style="width:70%">
                    </el-date-picker>
                </el-col>
                <el-col :span="8">
                     <span class="filter_span">IP地址</span>
                     <el-input v-model="username" placeholder="请输入用户名" style="width:70%"></el-input>
                </el-col>
            </el-row>

            <el-row :gutter="50" style="margin-top:30px">
                <el-col :span="8">
                    <span class="filter_span">错误规则</span>
                    <el-input v-model="username" placeholder="请输入用户名" style="width:70%"></el-input>
                </el-col>
                <el-col :span="8">
                   
                </el-col>
                <el-col :span="8"></el-col>
            </el-row>
            
            
        </el-card>
    </div>

    <div class="table-box">
    <el-card>
       <el-card class="searchresult">SearchResult <el-button class="button_check"> <i class="el-icon-view"></i> 查找</el-button></el-card>

      <el-table :data="mysqldata" style="width:100%;" header-row-style="font-size:16px;color:black"  fit stripe>
        <el-table-column label="时间" prop="time" ></el-table-column>
        <el-table-column label="用户IP" prop="realIp" ></el-table-column>
        <el-table-column label="越界方式" prop="method" ></el-table-column>
        <el-table-column label="访问地址" prop="address" ></el-table-column>
        <el-table-column label="user-agent" prop="ua"></el-table-column>
         <el-table-column label="游览详情" prop="data"></el-table-column>
        <el-table-column label="错误规则" prop="ruletag" ></el-table-column>
      </el-table>
      <el-pagination
        :page-size="20"
        :pager-count="11"
        layout="prev, pager, next"
        :total="1000"
        class="pagination">
     </el-pagination>
      </el-card>
    </div>
</div>
</template>

<script>
    export default {
        data() {
            return {
                user:"",
                startDate:"",
                endDate:"",
                errorCode:"",
                operationType:"",
                 options: [{
                    value: '1',
                    label: 'CONNECT'
                    }, {
                    value: '2',
                    label: 'QUERY'
                    }, {
                    value: '3',
                    label: 'TABLE'
                    }, {
                    value: '4',
                    label: 'QUERY_DDL'
                    }, {
                    value: '5',
                    label: 'QUERY_DML'
                    },
                    {
                    value: '6',
                    label: 'QUERY_DCL'
                    }],
                     value5: [],
                    value11: [],
                mysqldata: [{time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"},
                {time:"2018-10-21 04:34:46",realIp:"192.168.182.1",method:"GET",address:"localhost/test?ad=../1sd",ua:"-",data:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",ruletag:"\.\./"}]
                
            }
        },
    }
</script>

<style scoped>
.table-box{
    margin-top: 20px;
    margin-left: 30px;
    margin-right: 30px;
}

.search-box{
    margin-top: 20px;
    margin-left: 30px;
    margin-right: 30px;
}
.header{
    
}
.button_check{

    float:right;
    border: 1px solid #409EFF;
    color: #409EFF;
    font-size: 15px;
}
.bread{
    margin-bottom: 20px;
}

.searchresult{
    line-height:30px;
    font-size: 20px;
    font-weight: 800;
}
.filter_span{
    line-height: 40px;
    display: inline-block;
    margin-right: 20px;
    color: rgb(112, 112, 112)
}

.pagination{
    margin-top: 20px;
    text-align: center;
}
</style>