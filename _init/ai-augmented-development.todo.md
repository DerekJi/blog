# AI-Augmented Development: 写作规划

## 📌 系列总体策略
- **平台**：Medium
- **形式**：3篇系列文章
- **字数**：每篇3000中文字（约1500-1800英文单词）
- **核心理念**：循序渐进，从入门到精通，避免零散堆砌

---

## 📄 第1篇：AI-Augmented Development 101 - 基础与基石
**重点**：建立读者对VSCode Copilot Chat企业版的全面认识，掌握基础交互方式

### 核心内容大纲
1. **引言** (~300字)
   - 为什么AI-Augmented Development？vs Vibe Coding的本质差异
   - VSCode Copilot Chat企业版的优势
   - "我之前都在浪费时间"的开篇

2. **@ # / 基础语法** (~800字)
   - @：引入代码上下文
     - @workspace / @file / @symbol 的区别与用法
     - 常用命令示例：
       * **例子1**：`@file` 查看当前文件 → "帮我优化这个函数的性能"
       * **例子2**：`@workspace` 搜索整个项目 → "项目中有几个地方使用了 HttpClient，都用的哪种模式？"
       * **例子3**：`@symbol` 查找特定符号 → "@symbol UserService 我需要添加一个新的权限检查方法"
     - 场景对比：单文件问题用@file，全局架构问题用@workspace
   - #：引入变量与配置
     - 常见#变量解释
     - **例子**：
       * `#selection` 当前选中代码 → 选中一段BUG代码，"#selection 这段代码有什么问题？"
       * `#editor` 当前编辑配置 → "根据#editor的language设定，给我推荐合适的库"
   - /：快捷命令菜单
     - 常用/命令列举：
       * `/explain` → "解释这个复杂的LINQ查询"
       * `/fix` → "修复这个编译错误"
       * `/generate` → "生成单元测试"
       * `/doc` → "生成XML注释文档"
   - 实战示例：如何组合使用这些符号解决实际问题
     - **综合例子**："@file /fix 帮我修复这个NullReferenceException，并根据#selection的逻辑补充防空检查"

3. **Copilot Instructions 初体验** (~900字)
   - 什么是Instructions？全局vs库级的区别
     - 全局Instructions：对所有项目生效（如编码规范、语言偏好）
     - 库级Instructions：仅对当前项目生效（如项目特定的架构模式）
   - 为什么需要Instructions？提升一致性与效率
     - **例子1**：未使用Instructions vs 使用Instructions的对比
       * 未使用：AI随意生成代码注释（有中文、有英文、有简洁的、有啰嗦的）
       * 使用：统一所有代码注释为英文、遵循XML Doc格式
     - **例子2**：ASP.NET Core项目
       * 添加Instructions：所有API生成都遵循RESTful规范、使用async/await、返回IActionResult
   - **🔥 核心价值：成本与效果的平衡**
     - 实际案例：使用Claude **Haiku 4.5**（成本 0.33x）+ 优质Instructions
       * 可达到 **Sonnet 4.6 Low**（成本 1x）**几乎相当的效果**
       * 成本节省：约66%
       * 含义：好的Instructions是"模型优化剂" —— 弥补AI能力差距、降低成本
     - 质量保证：通过Instructions实现
       * Definition of Done：代码必须通过静态检查、包含单元测试、启动无误
       * Code Review清单：解决问题？没有新bug？命名清晰？注释一致？
       * 自动迭代循环：错误 → 修复 → 验证 → 再试，直到通过
   - 实例：编写简单的项目级指导原则
     - **具体案例**：
       ```
       # C# Project Guidelines
       - Use async/await for all I/O operations
       - Implement DI for all services
       - Follow naming: Interfaces start with I, internal methods with _
       - Always include unit tests
       - Run static analysis before submission
       ```
     - 设置后的效果：即使用便宜的Haiku模型，AI生成代码也遵循规范
   - 效果对比：有/无Instructions的差异
     - **例子**：生成一个用户管理Service
       * 无Instructions + Haiku：可能混乱、有同步方法、漏单测
       * 有Instructions + Haiku：完全等同于无Instructions + Sonnet的质量
       * 成本对比（5个任务）：
         - 方案A（无Instructions + Sonnet）：$5（5x1x）
         - 方案B（有Instructions + Haiku）：$1.65（5x0.33x）
         - 节省：67%的成本，质量相同 ✅

4. **关键要点回顾** (~200字)

### 配图建议
- @ # / 符号操作的截图对比
- Instructions文件结构示意图
- **成本对比图表**：Haiku vs Sonnet 的成本-效果曲线，展示Instructions如何改变曲线

### 真实Instructions范本（第1篇需要附录）
建议在文末附上一个真实、可用的完整Instructions示例，包含：
- **Definition of Done**
  ```
  - 代码通过静态检查且无语法错误
  - 必须包含或更新单元测试
  - 启动流程无误（已验证）
  - 如存在错误，自动进入修复循环直至成功
  ```
- **Code Review清单**
  ```
  1. 是否解决了问题？
  2. 是否引入了新bug？
  3. 是否有typo？
  4. 注释和代码是否一致？
  5. 命名是否清晰、没有歧义？
  ```
- **Development Isolation Guidelines** (针对.NET)
  ```
  - 编译必须使用：dotnet build --output ./agent-temp/
  - 运行必须指定独立端口：ASPNETCORE_URLS=http://localhost:5999
  - 完成后必须清理所有进程（Ctrl+C 或 kill）
  ```

### 文末导航
> 下一篇：《AI-Augmented Development 202 - 使用SKILLS与MCP扩展能力》

---

## 📄 第2篇：AI-Augmented Development 202 - SKILLS、MCP与命令行集成
**重点**：深化能力扩展，通过SKILLS和MCP实现定制化和自动化

### 核心内容大纲
1. **引言** (~200字)
   - SKILLS与MCP如何让Copilot更强大
   - 企业级应用的必备能力

2. **SKILLS深入指南** (~1000字)
   - 什么是SKILLS？架构与工作原理
     - SKILLS是特定领域知识的打包（如Azure DevOps、Entity Framework等）
   - SKILLS vs Instructions的联系与区别
     - **例子对比**：
       * Instructions：通用规范（"代码要用英文注释"）
       * SKILLS：专业知识（"Azure Cosmos DB最佳实践的SKILL"）
   - 如何开发/使用SKILLS
     - **具体例子**：
       * 内置SKILL：Azure Resources SKILL（自动获取Azure资源信息）
       * 自定义SKILL：创建"项目BUG分类SKILL"（自动根据症状判断BUG类型）
   - 实战案例：
     - **案例1**：Cosmos DB SKILL
       * 提问："我的查询很慢"
       * AI自动引入SKILL，给出分区建议、索引优化
     - **案例2**：Docker SKILL
       * 启用后，自动生成最优化的Dockerfile，推荐多阶段构建
     - **案例3**：Git工作流SKILL
       * 自动检测项目branch策略，推荐恰当的Git命令
   - 性能与效率提升数据
     - **例子**：使用SKILL前后对比
       * 前：手动查文档，5分钟才能找到Azure SDK正确用法
       * 后：AI+SKILL，30秒直接生成规范代码

3. **MCP（Model Context Protocol）介绍** (~900字)
   - MCP是什么？为什么MCP很重要？
     - MCP让Copilot能与外部工具实时交互，而不仅仅是回答问题
   - 常见MCP工具生态（GitHub、Jira、Azure等）
     - **例子1**：GitHub MCP
       * 启用后能直接查看PR、Issue、Commit
     - **例子2**：Jira MCP
       * 可在Copilot中查看任务、实时更新状态
     - **例子3**：Azure MCP
       * 直接查询Azure资源、部署状态
   - 如何配置与使用MCP
     - **步骤示例**：
       1. 在Copilot Settings中启用GitHub MCP
       2. 授权GitHub账户
       3. 在Chat中直接使用："/get-issue microsoft/vscode#123"
   - 典型场景：
     - **场景1**：自动同步GitHub Repo信息
       * 问："我们最近的PR都做了什么？"
       * AI通过MCP自动拉取最新10个PR的摘要
     - **场景2**：与Jira集成的项目管理
       * 问："哪些Bug修复了但还没部署？"
       * AI查询Jira，获取Status=Fixed但Release未设置的Issue
     - **场景3**：Azure环保资源查询
       * 问："生产环境的API服务현在的吞吐量是多少？"
       * AI通过MCP实时查询Azure metrics
   - 实战效果：大幅降低手动操作
     - **具体数据**：使用MCP前需要手工查5个不同平台，现在1条提问搞定

4. **命令行集成（gh/az等）** (~600字)
   - Copilot Chat如何与CLI工具配合
     - 在terminal中用Copilot Chat可以提高命令创建的精准度
   - gh（GitHub CLI）集成示例
     - **例子1**："我需要pr列表哪些是我create的且还没merge"
       * Copilot生成：`gh pr list --author=@me --state=open`
     - **例子2**："创建一个issue，标题为'Bug: 用户无法登录'，分配给我的team"
       * Copilot生成完整命令并执行
   - az（Azure CLI）集成示例
     - **例子1**："列出所有规模小于500GB的storage account"
       * Copilot生成正确的filter语法：
       ```
       az storage account list --query "[?properties.storage_account_sku.name=='Standard_LRS']"
       ```
     - **例子2**："部署这个ARM模板并等待完成"
       * AI根据你的需求生成Deploy命令并监控状态
   - 典型工作流演示
     - **场景**：完整CI/CD流程
       1. "创建Feature分支" → gh命令创建
       2. "推送代码并创建PR" → git + gh命令
       3. "检查部署状态" → az命令查询
       4. "更新Issue状态" → gh命令链接
       * 用户只需指导意图，Copilot生成所有CLI命令

5. **小结** (~200字)

### 配图建议
- SKILLS与Instructions的对比表
- MCP架构图
- CLI集成工作流示意图

### 文末导航
> 上一篇：《AI-Augmented Development 101 - 基础与基石》
> 下一篇：《AI-Augmented Development 303 - Agent选择、成本优化与最佳实践》

---

## 📄 第3篇：AI-Augmented Development 303 - Agent选择、优化与最佳实践
**重点**：成本意识、性能优化、团队协作中的session管理与AI使用策略

### 核心内容大纲
1. **引言** (~300字)
   - 大规模使用Copilot的成本与收益
   - 企业级应用的痛点

2. **Agent选择与成本平衡** (~800字)
   - 何时使用默认Agent，何时使用专用Agent
     - 默认Agent：轻量、快速
     - 专用Agent：功能完整、可用更多工具
   - **⚡ 理解模型成本系数（0.33x vs 1x）**
     - Copilot 使用多个AI模型，每个模型的成本不同：
       * **Haiku 4.5**：成本系数 **0.33x**（最经济的选择）
       * **Sonnet 4.6 Low**：成本系数 **1x**（平衡型）
       * **Sonnet 4.6**：成本系数 ~2x（最强能力）
     - 含义："0.33x" 表示成本仅为 Sonnet Low 的 1/3，但默认能力也相应降低
     - **关键发现**：好的Instructions可以逆转这个不等式！
       * Haiku 4.5 + 优质Instructions ≈ Sonnet 4.6 Low（效果相当，但成本省2/3）
   - 成本差异分析与ROI计算
     - **具体例子**：
       * 快速Q&A（"this方法的用法"）→ Haiku 4.5 → $0.003
       * 复杂重构（"把这个Service重构为微服务"）→ Sonnet → $0.018
       * 但使用Instructions，复杂重构用Haiku也能完成 → $0.006
       * **真实对比**：1小时人工$ 100，使用Haiku+Instructions节省$99.97，ROI无限大
   - 场景决策矩阵（更新）：
     - **快速问答 → Haiku 4.5**
       * 例：新员工学习.NET语法，多个快速提问
       * 成本：$0.05/天
     - **复杂任务 → Haiku 4.5 + 优质Instructions**
       * 例：分析整个项目的性能问题，需要查看多个文件和metrics
       * 成本：$0.6（相当于原来$1.8），但需要提前准备好Instructions
       * 节省：67%
     - **超复杂/创意任务 → Sonnet**
       * 例：全新系统设计、复杂算法研究
       * 成本：接受更高成本以获得最佳效果
   - 企业级配额管理建议（基于成本系数）
     - **参考案例**：一个20人团队，希望月度成本$500
       * 策略：80% 使用 Haiku (日常) + 20% 用 Sonnet (复杂任务)
       * 分配：
         - 每人基础配额：Haiku 用量等同于 $2.64/月（按0.33x计算）
         - 复杂任务池：$83.2（20x$4.16x20%）
       * 跟踪方式：按项目tag分配成本中心，月度审查
       * 效果：控制成本的同时，质量通过Instructions保证

3. **Session注意力分散问题** (~700字)
   - Session的生命周期与上下文限制
     - 一个Session最多记得最近的10k token（约6000字）
     - Session超时后所有上下文丢失
   - 常见问题：长Session中的令牌泄漏、上下文混乱
     - **例子1**：BUG排查Session
       * 开始："这个错误是什么原因？" → AI根据Stack trace精准定位
       * 中间经过30条消息后："根据之前的context再帮我检查..."
       * AI已丢失最初的Stack trace，给出的建议不相关
     - **例子2**：多任务混在一个Session
       * 先讨论API设计 → 后讨论DB优化 → 再讨论前端bug
       * AI的建议逐渐失焦，因为混乱了上下文
   - 最佳实践：
     - **按任务划分Session**
       * 案例：项目有3个同时进行的task
       * 创建3个独立Session，不混用
     - **定期"重启"Session保持清晰**
       * 当发现AI的回答偏离主题 → 新建Session
       * 清晰的上下文限制 = 更精准的答案
     - **使用Copilot Instructions维持一致性**
       * 例子：即使跨Session，Instructions保证代码风格一致
   - 实战：如何维护高效的多Session工作流
     - **场景**：同时做前端、后端两个功能
       * Session A（后端）：@file api/UserController.cs
       * Session B（前端）：@file pages/UserForm.tsx
       * 两个Session独立，互不干扰，效率提升30%

4. **团队协作最佳实践** (~700字)
   - 团队级Instructions与SKILLS共享
     - **例子1**：公司级Instructions
       * 统一编码规范（.NET Coding Guidelines）
       * 所有团队成员自动遵循规范，AI生成代码风格一致
     - **例子2**：部门共享SKILL
       * 后端团队共享"API设计SKILL"
       * 无论谁写API，都有一致的RESTful标准
   - 代码审查中使用Copilot Chat的注意事项
     - **使用场景**：
       * PR审查时："#selection 这段复杂逻辑能否更清晰？"
       * Copilot建议重构方案
     - **注意事项**：
       * AI的建议仅供参考，最终决定权在Code Reviewer
       * 关键业务逻辑必须由人类审查
   - 文档更新与维护策略
     - **例子1**：API文档更新
       * 代码改了 → "根据@file生成API文档更新"
       * AI生成更新的OpenAPI spec
     - **例子2**：README维护
       * 项目有大变动 → "/doc 更新README的使用说明部分"
   - "人类审查"的角色定位
     - **不是替代品**：AI生成 → 人类决策
     - **是工具**：加快流程、提高建议质量
   - 效率度量与反馈循环
     - **指标**：PR平均审查时间从2小时降到40分钟
     - **反馈**：记录"AI建议被采用/被改"的比例，持续优化

5. **常见误区与提示** (~400字)
   - 过度依赖AI生成代码
     - ❌ 误区：直接复制AI生成的生产代码而不测试
     - ✅ 做法：AI生成 → 自己审查逻辑 → 跑单测 → 代码审查
     - **例子**：AI生成Sql查询，但没考虑索引，直接上线导致性能问题
   - 忽视安全审查
     - ❌ 误区："AI生成的代码肯定安全"
     - ✅ 做法：特别检查@file中涉及权限、密钥、数据访问的代码
     - **例子**：AI生成的SQL拼接代码可能有SQL注入风险
   - Session管理不当导致的效率下降
     - ❌ 误区：一个Session处理所有问题
     - ✅ 做法：按功能划分Session，每个Session关注单一主题
   - 改进建议与快速检查清单
     - [ ] 你的Instructions覆盖了安全检查项吗？
     - [ ] 你的SKILLS集是否过时？（3个月检查一次）
     - [ ] 团队是否都知道Session正确使用方式？
     - [ ] 成本是否在预算内？（按月审查）

6. **总结与展望** (~200字)

### 配图建议
- Agent成本-效果矩阵图
- Session生命周期示意
- 团队工作流架构图

### 文末导航
> 上一篇：《AI-Augmented Development 202 - SKILLS、MCP与命令行集成》
> 系列完整导航：[第1篇] [第2篇] [第3篇]

---

## 🎯 每篇文章的共同要素
- [ ] 开篇对比：展示有/无该功能的效率差异，激发"我想试试"的欲望
  - **必须**配具体对比的具体数字（如时间、代码行数）
  - 第1篇：突出"好Instructions + 便宜模型 = 好效果 + 低成本"
- [ ] 实战代码示例：每个功能点都配实际可运行的示例
  - 第1篇：提供示例Instructions文件（包含DoD、Code Review、Isolation）
  - 第2篇：提供示例SKILL配置、MCP命令
  - 第3篇：提供Session管理的实际案例 + 成本表
- [ ] 截图与演示：操作界面截图+效果说明
  - 每个主要功能至少一张截图
  - 标注关键UI元素
  - 第1篇：特别展示Haiku+Instr的代码生成质量
- [ ] 常见坑点提示：红框标注"新手容易犯的错误"
  - 每篇至少3个误区警告
  - 提供解决方案
  - 第1篇误区："Instructions太详细了会变呆板"（应该平衡）
- [ ] 系列导航链接：每篇结尾明确指向其他文章
- [ ] 亲切感建设：贯穿全文的"你也可能经历"场景
  - 例子必须来自真实工作场景
  - 数字和细节都要真实可信
  - **特别强调**："我也被这个问题困过，直到设置了Instructions..."
  - 成本创意：突出"67%成本节省还保证质量"的冲击力

---

## � 详细的例子清单

### 第1篇需要的具体例子
1. **@ # / 语法的实际Prompt**
   - 5-8个真实的提问例子，每个配上期望的AI响应
2. **Instructions文件示例**
   - 完整的C# Project Instructions（包含DoD、Code Review、Development Isolation）
   - 完整的Frontend Project Instructions
   - 展示"为什么这个Instructions能让Haiku达到Sonnet的效果"
3. **成本对比数据**
   - Haiku 4.5 vs Sonnet 4.6 Low的真实成本比较
   - 加/不加Instructions的质量对比
   - 5个任务的成本计算表
4. **对比截图**
   - 有Instructions vs 无Instructions的代码生成对比
   - 展示Haiku+Instructions的输出质量
5. **3个新手坑**
   - 误区1：过度指导导致AI呆板
   - 误区2：Instructions写得太复杂
   - 误区3：不同框架用同一个Instructions

### 第2篇需要的具体例子
1. **SKILL配置文件**
   - 一个真实的SKILL配置示例（如Cosmos DB SKILL）
2. **MCP命令demo**
   - GitHub MCP：实际的gh命令结合截图
   - Jira MCP：实际的Issue查询结合截图
   - Azure MCP：实际的资源查询结合截图
3. **CLI命令生成**
   - 5个真实的gh / az提问 + 生成的命令
4. **效率对比数据**
   - 实际计时对比（手工操作 vs AI+MCP）

### 第3篇需要的具体例子
1. **成本计算表（基于模型系数）**
   - 真实对比：
     | 场景 | 模型 | 单位成本 | 5个任务 | Instructions影响 |
     |------|------|---------|--------|-----------------|
     | 快速提问 | Haiku | $0.003 | $0.015 | 无需 |
     | 代码生成 | Sonnet | $0.018 | $0.09 | 需要 |
     | 代码生成 | Haiku+Instr | $0.006 | $0.03 | 关键 |
     | **成本节省** | | | **67%** | **质量相当** |
   - 企业级配额分配案例（20人$500/月预算）
2. **Session分割案例及Instructions一致性**
   - 一个完整项目的Session划分方案
   - 展示Instructions如何跨Session维持质量
3. **团队指导文档示例**
   - 真实的Definition of Done文档
   - 真实的Code Review清单
   - Development & Sandbox Isolation guidelines
4. **模型选择决策流程**
   - 何时用Haiku（需要Instructions）
   - 何时用Sonnet（超复杂任务）
   - 成本vs效果的平衡点分析
5. **5个真实的工作场景**
   - 场景1：新员工入职，快速学习API → Haiku → 1天$0.5
   - 场景2：项目性能优化，complex analysis → Haiku+Instr vs Sonnet 对比
   - 场景3：全新系统架构设计 → 必须Sonnet，成本虽高但值得
   - 场景4：日常bug修复 → Haiku+Instr → 规模化使用
   - 场景5：代码审查辅助 → Haiku+Instr的Code Review清单自动化

---

## ⭐ 关键：让读者有"亲切感"的例子法则

**例子不是修饰，是刚需。每一个功能点必须通过例子实现以下目标：**

1. **会用**：读者看完例子就知道怎么用
   - 不够抽象的理论，必须是"粘贴即用"的提问
   - 第1篇：提供可直接复制的Instructions文本
   
2. **能感受**：读者能感受到具体的效率提升
   - 有对比（前vs后）
   - 有数字（时间、行数、**成本**）
   - 有视觉（截图）
   - **含金量**：67%成本节省 + 质量相当 = 读者会立即想用

3. **真实可信**：读者知道这真的能工作
   - 例子来自真实项目
   - 细节够真实（不生硬）
   - 坑点也是真实遇见过的
   - 成本数字是按0.33x/1x系数计算的（不是虚拟数据）

4. **有同理心**：读者看到自己
   - "我也遇见过这个问题"
   - "我之前就是这样做的，太慢了"
   - "这就是我需要的！"
   - **特别地**："我之前用Sonnet每月$500，现在用Haiku+Instructions只要$165..."

**写作时时刻想问自己：**
- ❓ 我能否粘贴这个例子直接用？
- ❓ 这个例子是否展示了真实效果？
- ❓ 读者能否从这个例子找到同感？
- ❓ 是否有足够的细节让读者相信？
- ❓ **新增**：这个例子是否包含具体的成本/效果数据？

---

## 📋 写作与发布清单
- [ ] 第2篇：完稿 → 发布Medium → 更新第1篇导航链接
- [ ] 第3篇：完稿 → 发布Medium → 更新前两篇导航链接
- [ ] 最终：验证所有导航链接有效

---

## 💡 核心策略
✅ **循序渐进**：101基础 → 202高阶 → 303实战优化
✅ **系统性**：每篇围绕一个完整主题，避免重复与遗漏
✅ **实用性**：每篇都有立即可用的实战内容
✅ **冲击力**：每篇开篇与结尾强化"效率革命"的感受
