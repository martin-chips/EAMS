# 高校学生评优评奖管理系统 College Student Evaluation Award Management System

> 说明：此系统是我的毕设项目学生评优评奖是学校的教学活动中很重要的环节，本文结合当下大多数院校的评优评奖规定，结合实际需求，分析现行学生评优评奖管理现状，收集了老师、同学等各个角色对该系统的需求，确定了此系统的需要实现的目标和主要功能需求。

> Description: This system is a key item in the school's teaching activities. This paper combines the evaluation criteria of most colleges and universities, combined with actual needs, analyzes the current status of student evaluation and evaluation. The collection of teachers, classmates and other roles for the system's needs, identified the needs of the system and the main functional requirements.

该系统具有以下特点：
The system has the following features:

(1)	实用性较强：当前我国高校均有各类评优评奖规章制度，却苦于无高效简单的系统将他们从繁琐的录入工作中解脱。同时在需要数据导入和导出的地方设计了导入导出功能，方便用户得到数据。

Strong practicability: At present, there are various evaluation and award rules and regulations in colleges and universities in China, but they suffer from the lack of efficient and simple systems to free them from the cumbersome entry work. At the same time, the import and export functions are designed in the place where data import and export are needed, so that users can get data.
 
(2)	易用美观性：系统界面、图标等设计采用年轻，扁平化的风格，以Bootstrap、layui等优秀开源框架为底层设计，符合当下审美观。程序界面设计简单明了，功能集中，描述准确，用户不需要耗费时间精力来学习系统。

Easy-to-use aesthetics: The system interface and icons are designed in a young, flat style. The excellent open source frameworks such as Bootstrap and layui are designed as the bottom layer, which is in line with the current aesthetics. The program interface design is simple and clear, the function is centralized, the description is accurate, and the user does not need to spend time and energy to learn the system.
               
 (3)安全性：系统使用Apache开源框架Shiro作为核心权限校验框架，实现了细粒度的永久权限控制。同时对用户的各类操作进行记录，以达到追根溯源，查找问题的目的。
 
  Security: The system uses the Apache open source framework Shiro as the core authority verification framework to achieve fine-grained permanent access control. At the same time, the user's various operations are recorded to achieve the purpose of tracing the source and finding the problem.
  
(4)	易扩展性：系统采用Maven多模块设计，根据实际业务模块进行划分，方便技术升级或转型，系统使用Swagger等API接口框架，开发者可以根据实际情况对系统业务进行理解和扩展。

Ease of scalability: The system adopts Maven multi-module design, which is divided according to actual business modules to facilitate technology upgrade or transformation. The system uses API interface framework such as Swagger, developers can understand and expand system services according to actual conditions.

(5)	多部门联动：评优评奖系统设置由各个部门负责具体模块下的审批，达到多部门协作的目的。

Multi-department linkage: The evaluation of the evaluation award system is carried out by each department under the specific module approval, achieving the purpose of multi-sector collaboration.

# 部分截图 Partial screenshot

![Ef78GF.png](https://s2.ax1x.com/2019/05/11/Ef78GF.png)

![Ef7tM9.png](https://s2.ax1x.com/2019/05/11/Ef7tM9.png)

![Ef7JxJ.png](https://s2.ax1x.com/2019/05/11/Ef7JxJ.png)

![Ef7NrR.png](https://s2.ax1x.com/2019/05/11/Ef7NrR.png)

![Ef7G24.png](https://s2.ax1x.com/2019/05/11/Ef7G24.png)

![Ef7dVx.png](https://s2.ax1x.com/2019/05/11/Ef7dVx.png)

![Ef7Uq1.png](https://s2.ax1x.com/2019/05/11/Ef7Uq1.png)
# 数据库关系图 Database diagram
![EfT2NT.png](https://s2.ax1x.com/2019/05/11/EfT2NT.png)

# 管理员端功能设计模块 Administrator function design module

![EfTgEV.png](https://s2.ax1x.com/2019/05/11/EfTgEV.png)