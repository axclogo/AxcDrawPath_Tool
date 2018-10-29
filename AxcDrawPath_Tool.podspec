
Pod::Spec.new do |s|

    s.name         = "AxcDrawPath_Tool"

    s.version      = "1.0.1"

    s.summary      = "AxcAEKit系列拆分出来的一个贝塞尔曲线绘制工具，以科技风为主，动画为辅."

    s.ios.deployment_target = '8.0'

    s.homepage     = "https://github.com/axclogo/AxcDrawPath_Tool"

    s.license              = { :type => "MIT", :file => "LICENSE" }

    s.author             = { "赵新" => "axclogo@163.com" }

    s.social_media_url   = "http://www.cnblogs.com/axclogo/"

    s.source       = { :git => "https://github.com/axclogo/AxcDrawPath_Tool.git", :tag => s.version }

    s.source_files  = 'AxcDrawPath_Tool/AxcDrawPathPackage/**/*'
 
    s.requires_arc = true


end
