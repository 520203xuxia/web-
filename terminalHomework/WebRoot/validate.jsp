<%@ page language="java"
	import="java.awt.*"
	import="java.awt.image.BufferedImage"
	import="java.util.*"
	import="javax.imageio.ImageIO"
	import="java.awt.geom.AffineTransform"
	import="java.awt.Graphics2D"
	import="java.awt.Graphics"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setContentType("image/JPEG");
	// 在内存中创建图象 
	int width = 80, height = 40,line=15;
	BufferedImage image = new BufferedImage(width, height,
		BufferedImage.TYPE_INT_RGB);
	//获取画笔
	Graphics2D g =(Graphics2D) image.getGraphics();
	//设定背景色 
	g.setColor(Color.BLACK);
	g.fillRect(0, 0, width, height);
	//g.setColor(Color.black);
	g.setFont(new Font("宋体", Font.BOLD, 20));
	
	//取随机产生的验证码(4位数字) 
	Random r = new Random(new Date().getTime());
	
	//将验证码存入session
	String randStr="";
	for(int i=0;i<4;i++){
            String str = ""+r.nextInt(10);
            //处理旋转          
            AffineTransform Tx = new AffineTransform();
            Tx.rotate(Math.random(), 5+i*15, height-5);
            //用弧度测量的旋转角度,旋转锚点的 X 坐标,旋转锚点的 Y 坐标
            //Tx.scale(0.7+Math.random(), 0.7+Math.random());
            //x坐标方向的缩放倍数，y坐标方向的缩放倍数
            g.setTransform(Tx);
            Color c = new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255));
            g.setColor(c);
            g.drawString(str, 2+i*width/4, height-13);
            randStr+=str;
        }
        session.setAttribute("randStr", randStr);
        //干扰线
        for(int i=0;i<line;i++){
            Color c = new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255));
            g.setColor(c);
            g.drawLine(r.nextInt(width), r.nextInt(height), r.nextInt(width), r.nextInt(height));
        }
	//将验证码显示到图象中 	
	// 输出图象到页面 
	ImageIO.write(image, "JPEG", response.getOutputStream());
	out.clear();
	out = pageContext.pushBody();
%>
