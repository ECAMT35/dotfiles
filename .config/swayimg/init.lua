-- swayimg 默认快捷键（摘自 USAGE.md）
--
-- 查看模式（Viewer）/ 幻灯片模式（Slideshow）
--
-- Esc            退出程序
-- Enter          切换到图库模式
-- s              开启/关闭幻灯片
-- Insert         标记/取消标记当前图片
-- f              全屏切换
-- a              抗锯齿开关
-- [              逆时针旋转 90°
-- ]              顺时针旋转 90°
-- m              垂直翻转
-- Shift-m        水平翻转
-- t              显示/隐藏信息层
-- PgUp           上一张图片
-- PgDown         下一张图片
-- Shift-PgUp     上一帧
-- Shift-PgDown   下一帧
-- +              放大
-- -              缩小
-- ← → ↑ ↓        移动图片
-- Backspace      重置缩放和位置
--
-- 图库模式（Gallery）
--
-- Home           选中第一张缩略图
-- End            选中最后一张缩略图
-- ← → ↑ ↓        移动选中项
-- PgUp           上一页
-- PgDown         下一页
-- Enter          打开选中的图片
-- s              幻灯片模式
-- Insert         标记/取消标记图片
-- f              全屏切换
-- a              抗锯齿开关
-- +              增大缩略图
-- -              缩小缩略图
-- t              显示/隐藏信息层
----------------------------------------------------------------------

----------------------------------------------------------------------
-- 自定义快捷键
----------------------------------------------------------------------

-- n：下一张
swayimg.viewer.on_key("n", function()
    swayimg.viewer.switch_image("next")
end)

-- p：上一张
swayimg.viewer.on_key("p", function()
    swayimg.viewer.switch_image("prev")
end)

-- 0：重置缩放和位置
swayimg.viewer.on_key("0", function()
    swayimg.viewer.reset()
end)
