<template>
    <div class="addEdit-block">
        <el-form
                class="detail-form-content"
                ref="ruleForm"
                :model="ruleForm"
                :rules="rules"
                label-width="auto"
                >
            <el-row>
                <input id="updateId" name="id" type="hidden">
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="任务标题" prop="renwuName">
                       <el-input v-model="ruleForm.renwuName"
                                 placeholder="任务标题" clearable  :readonly="ro.renwuName"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="任务标题" prop="renwuName">
                           <el-input v-model="ruleForm.renwuName"
                                     placeholder="任务标题" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
                <el-col :span="12">
                    <el-form-item class="upload" v-if="type!='info' && !ro.renwuPhoto" label="任务介绍图" prop="renwuPhoto">
                        <file-upload
                            tip="点击上传任务介绍图"
                            action="file/upload"
                            :limit="3"
                            :multiple="true"
                            :fileUrls="ruleForm.renwuPhoto?$base.url+ruleForm.renwuPhoto:''"
                            @change="renwuPhotoUploadChange"
                        ></file-upload>
                    </el-form-item>
                    <div v-else>
                        <el-form-item v-if="ruleForm.renwuPhoto" label="任务介绍图" prop="renwuPhoto">
                            <img style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in (ruleForm.renwuPhoto || '').split(',')" :src="$base.url+item" width="100" height="100">
                        </el-form-item>
                    </div>
                </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="职位" prop="renwuZhiwei">
                       <el-input v-model="ruleForm.renwuZhiwei"
                                 placeholder="职位" clearable  :readonly="ro.renwuZhiwei"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="职位" prop="renwuZhiwei">
                           <el-input v-model="ruleForm.renwuZhiwei"
                                     placeholder="职位" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="报酬" prop="renwuBaocou">
                       <el-input v-model="ruleForm.renwuBaocou"
                                 placeholder="报酬" clearable  :readonly="ro.renwuBaocou"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="报酬" prop="renwuBaocou">
                           <el-input v-model="ruleForm.renwuBaocou"
                                     placeholder="报酬" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="工作时间" prop="renwuShijian">
                       <el-input v-model="ruleForm.renwuShijian"
                                 placeholder="工作时间" clearable  :readonly="ro.renwuShijian"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="工作时间" prop="renwuShijian">
                           <el-input v-model="ruleForm.renwuShijian"
                                     placeholder="工作时间" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
                <el-col :span="24">
                    <el-form-item v-if="type!='info'"  label="任务" prop="renwuText">
                        <el-input type="textarea"  :readonly="ro.renwuText" v-model="ruleForm.renwuText" placeholder="任务"></el-input>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item v-if="ruleForm.renwuText" label="任务" prop="renwuText">
                            <span v-html="ruleForm.renwuText"></span>
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="12">
                    <el-form-item v-if="type!='info' && !ro.renwuTime"  class="input" label="起止时间" prop="renwuTime">
                        <el-date-picker
                                value-format="yyyy-MM-dd HH:mm:ss"
                                v-model="ruleForm.renwuTime"
                                type="datetime"
                                placeholder="起止时间"
                                :disabled="ro.renwuTime">
                        </el-date-picker>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item v-if="ruleForm.renwuTime" label="起止时间" prop="renwuTime">
                            <span v-html="ruleForm.renwuTime"></span>
                        </el-form-item>
                    </div>
                </el-col>

               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="工作地点" prop="renwuAddress">
                       <el-input v-model="ruleForm.renwuAddress"
                                 placeholder="工作地点" clearable  :readonly="ro.renwuAddress"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="工作地点" prop="renwuAddress">
                           <el-input v-model="ruleForm.renwuAddress"
                                     placeholder="工作地点" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="负责人" prop="renwuFuzhenr">
                       <el-input v-model="ruleForm.renwuFuzhenr"
                                 placeholder="负责人" clearable  :readonly="ro.renwuFuzhenr"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="负责人" prop="renwuFuzhenr">
                           <el-input v-model="ruleForm.renwuFuzhenr"
                                     placeholder="负责人" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="联系方式" prop="renwuPhone">
                       <el-input v-model="ruleForm.renwuPhone"
                                 placeholder="联系方式" clearable  :readonly="ro.renwuPhone"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="联系方式" prop="renwuPhone">
                           <el-input v-model="ruleForm.renwuPhone"
                                     placeholder="联系方式" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="报名信息" prop="renwuBaoming">
                       <el-input v-model="ruleForm.renwuBaoming"
                                 placeholder="报名信息" clearable  :readonly="ro.renwuBaoming"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="报名信息" prop="renwuBaoming">
                           <el-input v-model="ruleForm.renwuBaoming"
                                     placeholder="报名信息" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
                <el-col :span="12">
                    <el-form-item class="select" v-if="type!='info'"  label="任务类型" prop="renwuTypes">
                        <el-select v-model="ruleForm.renwuTypes" :disabled="ro.renwuTypes" placeholder="请选择任务类型">
                            <el-option
                                v-for="(item,index) in renwuTypesOptions"
                                v-bind:key="item.codeIndex"
                                :label="item.indexName"
                                :value="item.codeIndex">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item class="input" label="任务类型" prop="renwuValue">
                        <el-input v-model="ruleForm.renwuValue"
                            placeholder="任务类型" readonly></el-input>
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="12">
                    <el-form-item v-if="type!='info' && !ro.jieshuTime"  class="input" label="结束时间" prop="jieshuTime">
                        <el-date-picker
                                value-format="yyyy-MM-dd HH:mm:ss"
                                v-model="ruleForm.jieshuTime"
                                type="datetime"
                                placeholder="结束时间"
                                :disabled="ro.jieshuTime">
                        </el-date-picker>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item v-if="ruleForm.jieshuTime" label="结束时间" prop="jieshuTime">
                            <span v-html="ruleForm.jieshuTime"></span>
                        </el-form-item>
                    </div>
                </el-col>

                <el-col :span="12">
                    <el-form-item class="select" v-if="type!='info'"  label="任务状态" prop="zhugtaiTypes">
                        <el-select v-model="ruleForm.zhugtaiTypes" :disabled="ro.zhugtaiTypes" placeholder="请选择任务状态">
                            <el-option
                                v-for="(item,index) in zhugtaiTypesOptions"
                                v-bind:key="item.codeIndex"
                                :label="item.indexName"
                                :value="item.codeIndex">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item class="input" label="任务状态" prop="zhugtaiValue">
                        <el-input v-model="ruleForm.zhugtaiValue"
                            placeholder="任务状态" readonly></el-input>
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="24">
                    <el-form-item v-if="type!='info' && !ro.renwuContent"  label="任务介绍" prop="renwuContent">
                        <editor style="min-width: 200px; max-width: 600px;"
                                v-model="ruleForm.renwuContent"
                                class="editor"
                                action="file/upload">
                        </editor>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item v-if="ruleForm.renwuContent" label="任务介绍" prop="renwuContent">
                            <span v-html="ruleForm.renwuContent"></span>
                        </el-form-item>
                    </div>
                </el-col>
            </el-row>
            <el-form-item class="btn">
                <el-button v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
                <el-button v-if="type!='info'" class="btn-close" @click="back()">取消</el-button>
                <el-button v-if="type=='info'" class="btn-close" @click="back()">返回</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    import styleJs from "../../../utils/style.js";
    // 数字，邮件，手机，url，身份证校验
    import { isNumber,isIntNumer,isEmail,isPhone, isMobile,isURL,checkIdCard } from "@/utils/validate";
    import utilsJs, {getYearFormat,getMonthFormat,getDateFormat,getDatetimeFormat} from "../../../utils/utils.js";
    export default {
        data() {
            return {
                addEditForm:null,
                id: '',
                type: '',
                sessionTable : "",//登录账户所在表名
                role : "",//权限
                userId:"",//当前登录人的id
                ro:{
                    renwuName: false,
                    renwuPhoto: false,
                    renwuZhiwei: false,
                    renwuBaocou: false,
                    renwuShijian: false,
                    renwuText: false,
                    renwuTime: false,
                    renwuAddress: false,
                    renwuFuzhenr: false,
                    renwuPhone: false,
                    renwuBaoming: false,
                    renwuTypes: false,
                    jieshuTime: false,
                    zhugtaiTypes: false,
                    renwuContent: false,
                    renwuDelete: false,
                    insertTime: false,
                },
                ruleForm: {
                    renwuName: '',
                    renwuPhoto: '',
                    renwuZhiwei: '',
                    renwuBaocou: '',
                    renwuShijian: '',
                    renwuText: '',
                    renwuTime: '',
                    renwuAddress: '',
                    renwuFuzhenr: '',
                    renwuPhone: '',
                    renwuBaoming: '',
                    renwuTypes: '',
                    jieshuTime: '',
                    zhugtaiTypes: '',
                    renwuContent: '',
                    renwuDelete: '',
                    insertTime: '',
                },
                renwuTypesOptions : [],
                zhugtaiTypesOptions : [],
                rules: {
                   renwuName: [
                              { required: true, message: '任务标题不能为空', trigger: 'blur' },
                          ],
                   renwuPhoto: [
                              { required: true, message: '任务介绍图不能为空', trigger: 'blur' },
                          ],
                   renwuZhiwei: [
                              { required: true, message: '职位不能为空', trigger: 'blur' },
                          ],
                   renwuBaocou: [
                              { required: true, message: '报酬不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]{0,6}(\.[0-9]{1,2})?$/,
                                  message: '只允许输入整数6位,小数2位的数字',
                                  trigger: 'blur'
                              }
                          ],
                   renwuShijian: [
                              { required: true, message: '工作时间不能为空', trigger: 'blur' },
                          ],
                   renwuText: [
                              { required: true, message: '任务不能为空', trigger: 'blur' },
                          ],
                   renwuTime: [
                              { required: true, message: '起止时间不能为空', trigger: 'blur' },
                          ],
                   renwuAddress: [
                              { required: true, message: '工作地点不能为空', trigger: 'blur' },
                          ],
                   renwuFuzhenr: [
                              { required: true, message: '负责人不能为空', trigger: 'blur' },
                          ],
                   renwuPhone: [
                              {  required: true, message: '联系方式不能为空', trigger: 'blur' },
                              {  pattern: /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/,
                                 message: '联系方式格式不对',
                                 trigger: 'blur'
                              }
                          ],
                   renwuBaoming: [
                              { required: true, message: '报名信息不能为空', trigger: 'blur' },
                          ],
                   renwuTypes: [
                              { required: true, message: '任务类型不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]*$/,
                                  message: '只允许输入整数',
                                  trigger: 'blur'
                              }
                          ],
                   jieshuTime: [
                              { required: true, message: '结束时间不能为空', trigger: 'blur' },
                          ],
                   zhugtaiTypes: [
                              { required: true, message: '任务状态不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]*$/,
                                  message: '只允许输入整数',
                                  trigger: 'blur'
                              }
                          ],
                   renwuContent: [
                              { required: true, message: '任务介绍不能为空', trigger: 'blur' },
                          ],
                   renwuDelete: [
                              { required: true, message: '逻辑删除不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]*$/,
                                  message: '只允许输入整数',
                                  trigger: 'blur'
                              }
                          ],
                   insertTime: [
                              { required: true, message: '发布日期不能为空', trigger: 'blur' },
                          ],
                }
            };
        },
        props: ["parent"],
        computed: {
        },
        created() {
            //获取当前登录用户的信息
            this.sessionTable = this.$storage.get("sessionTable");
            this.role = this.$storage.get("role");
            this.userId = this.$storage.get("userId");


            if (this.role != "管理员"){
            }else{
            }
            this.addEditForm = styleJs.addStyle();
            this.addEditStyleChange()
            this.addEditUploadStyleChange()
            //获取下拉框信息
                this.$http({
                    url:`dictionary/page?page=1&limit=100&sort=&order=&dicCode=renwu_types`,
                    method: "get"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        this.renwuTypesOptions = data.data.list;
                    }
                });
                this.$http({
                    url:`dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhugtai_types`,
                    method: "get"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        this.zhugtaiTypesOptions = data.data.list;
                    }
                });


        },
        mounted() {
        },
        methods: {
            // 下载
            download(file){
                window.open(`${file}`)
            },
            // 初始化
            init(id,type) {
                if (id) {
                    this.id = id;
                    this.type = type;
                }
                if(this.type=='info'||this.type=='else'){
                    this.info(id);
                }
                // 获取用户信息
                this.$http({
                    url:`${this.$storage.get("sessionTable")}/session`,
                    method: "get"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        var json = data.data;
                    } else {
                        this.$message.error(data.msg);
                    }
                });
            },
            // 多级联动参数
            info(id) {
                let _this =this;
                _this.$http({
                    url: `renwu/info/${id}`,
                    method: 'get'
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        _this.ruleForm = data.data;
                        _this.ruleForm.renwuContent = _this.ruleForm.renwuContent.replaceAll("src=\"upload/","src=\""+this.$base.url+"upload/");
                    } else {
                        _this.$message.error(data.msg);
                    }
                });
            },
            // 提交
            onSubmit() {
                this.$refs["ruleForm"].validate(valid => {
                    if (valid) {
                        this.ruleForm.renwuContent = this.ruleForm.renwuContent.replaceAll(this.$base.url,"");
                        this.$http({
                            url:`renwu/${!this.ruleForm.id ? "save" : "update"}`,
                            method: "post",
                            data: this.ruleForm
                        }).then(({ data }) => {
                            if (data && data.code === 0) {
                                this.$message({
                                    message: "操作成功",
                                    type: "success",
                                    duration: 1500,
                                    onClose: () => {
                                        this.parent.showFlag = true;
                                        this.parent.addOrUpdateFlag = false;
                                        this.parent.renwuCrossAddOrUpdateFlag = false;
                                        this.parent.search();
                                        this.parent.contentStyleChange();
                                    }
                                });
                            } else {
                                this.$message.error(data.msg);
                            }
                        });
                    }
                });
            },
            // 获取uuid
            getUUID () {
                return new Date().getTime();
            },
            // 返回
            back() {
                this.parent.showFlag = true;
                this.parent.addOrUpdateFlag = false;
                this.parent.renwuCrossAddOrUpdateFlag = false;
                this.parent.contentStyleChange();
            },
            //图片
            renwuPhotoUploadChange(fileUrls){
                this.ruleForm.renwuPhoto = fileUrls;
                this.addEditUploadStyleChange()
            },

            addEditStyleChange() {
                this.$nextTick(()=>{
                    // input
                    document.querySelectorAll('.addEdit-block .input .el-input__inner').forEach(el=>{
                        el.style.height = this.addEditForm.inputHeight
                        el.style.color = this.addEditForm.inputFontColor
                        el.style.fontSize = this.addEditForm.inputFontSize
                        el.style.borderWidth = this.addEditForm.inputBorderWidth
                        el.style.borderStyle = this.addEditForm.inputBorderStyle
                        el.style.borderColor = this.addEditForm.inputBorderColor
                        el.style.borderRadius = this.addEditForm.inputBorderRadius
                        el.style.backgroundColor = this.addEditForm.inputBgColor
                    })
                    document.querySelectorAll('.addEdit-block .input .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.inputHeight
                        el.style.color = this.addEditForm.inputLableColor
                        el.style.fontSize = this.addEditForm.inputLableFontSize
                    })
                    // select
                    document.querySelectorAll('.addEdit-block .select .el-input__inner').forEach(el=>{
                        el.style.height = this.addEditForm.selectHeight
                        el.style.color = this.addEditForm.selectFontColor
                        el.style.fontSize = this.addEditForm.selectFontSize
                        el.style.borderWidth = this.addEditForm.selectBorderWidth
                        el.style.borderStyle = this.addEditForm.selectBorderStyle
                        el.style.borderColor = this.addEditForm.selectBorderColor
                        el.style.borderRadius = this.addEditForm.selectBorderRadius
                        el.style.backgroundColor = this.addEditForm.selectBgColor
                    })
                    document.querySelectorAll('.addEdit-block .select .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.selectHeight
                        el.style.color = this.addEditForm.selectLableColor
                        el.style.fontSize = this.addEditForm.selectLableFontSize
                    })
                    document.querySelectorAll('.addEdit-block .select .el-select__caret').forEach(el=>{
                        el.style.color = this.addEditForm.selectIconFontColor
                        el.style.fontSize = this.addEditForm.selectIconFontSize
                    })
                    // date
                    document.querySelectorAll('.addEdit-block .date .el-input__inner').forEach(el=>{
                        el.style.height = this.addEditForm.dateHeight
                        el.style.color = this.addEditForm.dateFontColor
                        el.style.fontSize = this.addEditForm.dateFontSize
                        el.style.borderWidth = this.addEditForm.dateBorderWidth
                        el.style.borderStyle = this.addEditForm.dateBorderStyle
                        el.style.borderColor = this.addEditForm.dateBorderColor
                        el.style.borderRadius = this.addEditForm.dateBorderRadius
                        el.style.backgroundColor = this.addEditForm.dateBgColor
                    })
                    document.querySelectorAll('.addEdit-block .date .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.dateHeight
                        el.style.color = this.addEditForm.dateLableColor
                        el.style.fontSize = this.addEditForm.dateLableFontSize
                    })
                    document.querySelectorAll('.addEdit-block .date .el-input__icon').forEach(el=>{
                        el.style.color = this.addEditForm.dateIconFontColor
                        el.style.fontSize = this.addEditForm.dateIconFontSize
                        el.style.lineHeight = this.addEditForm.dateHeight
                    })
                    // upload
                    let iconLineHeight = parseInt(this.addEditForm.uploadHeight) - parseInt(this.addEditForm.uploadBorderWidth) * 2 + 'px'
                    document.querySelectorAll('.addEdit-block .upload .el-upload--picture-card').forEach(el=>{
                        el.style.width = this.addEditForm.uploadHeight
                        el.style.height = this.addEditForm.uploadHeight
                        el.style.borderWidth = this.addEditForm.uploadBorderWidth
                        el.style.borderStyle = this.addEditForm.uploadBorderStyle
                        el.style.borderColor = this.addEditForm.uploadBorderColor
                        el.style.borderRadius = this.addEditForm.uploadBorderRadius
                        el.style.backgroundColor = this.addEditForm.uploadBgColor
                    })
                    document.querySelectorAll('.addEdit-block .upload .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.uploadHeight
                        el.style.color = this.addEditForm.uploadLableColor
                        el.style.fontSize = this.addEditForm.uploadLableFontSize
                    })
                    document.querySelectorAll('.addEdit-block .upload .el-icon-plus').forEach(el=>{
                        el.style.color = this.addEditForm.uploadIconFontColor
                        el.style.fontSize = this.addEditForm.uploadIconFontSize
                        el.style.lineHeight = iconLineHeight
                        el.style.display = 'block'
                    })
                    // 多文本输入框
                    document.querySelectorAll('.addEdit-block .textarea .el-textarea__inner').forEach(el=>{
                        el.style.height = this.addEditForm.textareaHeight
                        el.style.color = this.addEditForm.textareaFontColor
                        el.style.fontSize = this.addEditForm.textareaFontSize
                        el.style.borderWidth = this.addEditForm.textareaBorderWidth
                        el.style.borderStyle = this.addEditForm.textareaBorderStyle
                        el.style.borderColor = this.addEditForm.textareaBorderColor
                        el.style.borderRadius = this.addEditForm.textareaBorderRadius
                        el.style.backgroundColor = this.addEditForm.textareaBgColor
                    })
                    document.querySelectorAll('.addEdit-block .textarea .el-form-item__label').forEach(el=>{
                        // el.style.lineHeight = this.addEditForm.textareaHeight
                        el.style.color = this.addEditForm.textareaLableColor
                        el.style.fontSize = this.addEditForm.textareaLableFontSize
                    })
                    // 保存
                    document.querySelectorAll('.addEdit-block .btn .btn-success').forEach(el=>{
                        el.style.width = this.addEditForm.btnSaveWidth
                        el.style.height = this.addEditForm.btnSaveHeight
                        el.style.color = this.addEditForm.btnSaveFontColor
                        el.style.fontSize = this.addEditForm.btnSaveFontSize
                        el.style.borderWidth = this.addEditForm.btnSaveBorderWidth
                        el.style.borderStyle = this.addEditForm.btnSaveBorderStyle
                        el.style.borderColor = this.addEditForm.btnSaveBorderColor
                        el.style.borderRadius = this.addEditForm.btnSaveBorderRadius
                        el.style.backgroundColor = this.addEditForm.btnSaveBgColor
                    })
                    // 返回
                    document.querySelectorAll('.addEdit-block .btn .btn-close').forEach(el=>{
                        el.style.width = this.addEditForm.btnCancelWidth
                        el.style.height = this.addEditForm.btnCancelHeight
                        el.style.color = this.addEditForm.btnCancelFontColor
                        el.style.fontSize = this.addEditForm.btnCancelFontSize
                        el.style.borderWidth = this.addEditForm.btnCancelBorderWidth
                        el.style.borderStyle = this.addEditForm.btnCancelBorderStyle
                        el.style.borderColor = this.addEditForm.btnCancelBorderColor
                        el.style.borderRadius = this.addEditForm.btnCancelBorderRadius
                        el.style.backgroundColor = this.addEditForm.btnCancelBgColor
                    })
                })
            },
            addEditUploadStyleChange() {
                this.$nextTick(()=>{
                    document.querySelectorAll('.addEdit-block .upload .el-upload-list--picture-card .el-upload-list__item').forEach(el=>{
                        el.style.width = this.addEditForm.uploadHeight
                        el.style.height = this.addEditForm.uploadHeight
                        el.style.borderWidth = this.addEditForm.uploadBorderWidth
                        el.style.borderStyle = this.addEditForm.uploadBorderStyle
                        el.style.borderColor = this.addEditForm.uploadBorderColor
                        el.style.borderRadius = this.addEditForm.uploadBorderRadius
                        el.style.backgroundColor = this.addEditForm.uploadBgColor
                    })
                })
            },
        }
    };
</script>
<style lang="scss">
.editor{
	  height: 500px;

	  & /deep/ .ql-container {
		  height: 310px;
	  }
	}
	.amap-wrapper {
	  width: 100%;.editor{
	  height: 500px;

	  & /deep/ .ql-container {
		  height: 310px;
	  }
	}
	.amap-wrapper {
	  width: 100%;
	  height: 500px;
	}
	.search-box {
	  position: absolute;
	}
	.addEdit-block {
		margin: -10px;
	}
	.detail-form-content {
		padding: 12px;
		background-color: transparent;
	}
	.btn .el-button {
	  padding: 0;
	}
}</style>

