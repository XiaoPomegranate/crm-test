<%@page contentType="text/html; charset=UTF-8" %>
<!-- 导入Excel的模态窗口 -->
<div class="modal fade" id="importModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">导入数据</h4>
            </div>
            <div class="modal-body">
                <div>
                    <h3>重要提示</h3>
                    <ul>
                        <li>给定文件的第一行将视为字段名。</li>
                        <li>请确认您的文件大小不超过5MB。</li>
                        <li>从XLS/XLSX文件中导入全部重复记录之前都会被忽略。</li>
                        <li>复选框值应该是1或者0。</li>
                        <li>日期值必须为MM/dd/yyyy格式。任何其它格式的日期都将被忽略。</li>
                        <li>日期时间必须符合MM/dd/yyyy hh:mm:ss的格式，其它格式的日期时间将被忽略。</li>
                        <li>默认情况下，字符编码是UTF-8 (统一码)，请确保您导入的文件使用的是正确的字符编码方式。</li>
                        <li>建议您在导入真实数据之前用测试文件测试文件导入功能。</li>
                    </ul>
                </div>
                <div class="importExcel">
                    <input type="text" readonly />
                    <label for="selectFile">
                        <span class="glyphicon glyphicon-search"></span> 选择文件
                    </label>
                    <input id="selectFile" type="file" multiple />
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" data-dismiss="modal">导入</button>
            </div>
        </div>
    </div>
</div>