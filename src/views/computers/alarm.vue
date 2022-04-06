<template>
    <div>
        <el-breadcrumb separator="/" style="margin:20px">
            <el-breadcrumb-item><i class="el-icon-menu"></i>服务器管理</el-breadcrumb-item>
            <el-breadcrumb-item>管理</el-breadcrumb-item>
        </el-breadcrumb>   


       <!-- <div id="events">

        <Timeline pending>
            <template v-for="event in events">
                <TimelineItem :color="event.color" v-if="event.color!=null">
                    <div class="time">{{event.time}}</div>
                    <div class="contents"></div>
                    <Alert type="warning" showIcon style="position: relative;">

                        <router-link :to="{path:'hostDetail',query:{hostid:event.hosts[0].hostid}}">{{event.desc}}</router-link>
                        <i-switch size="large" v-model="event.acknowledged!=0" style="position: absolute;right:10px;">
                            <span slot="close">确认</span>
                            <span slot="open">完成</span>
                        </i-switch>
                    </Alert>
                </TimelineItem>
            </template>
        </Timeline>
    </div> -->

        <Time-line pending >
            <Timeline-Item>发布1.0版本</Timeline-Item>
            <Timeline-Item>发布2.0版本</Timeline-Item>
            <Timeline-Item>发布3.0版本</Timeline-Item>
            <Timeline-Item><a href="#">查看更多</a></Timeline-Item>
        </Time-line>

    </div>
</template>

<script>
    export default {
        
    }
</script>

<style scoped>

</style>
