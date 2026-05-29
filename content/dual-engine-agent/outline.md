# Outline: 双引擎 Agent——用四层压缩让通用 Agent 又快又省

## Structure (target: 1500-1800 words)

### 1. Introduction (~150 words)
- **Hook**：RTK 和 CodeGraph 最近刷屏，但它们只解决了 coding agent 的效率问题——通用 Agent 怎么办？
- **Problem**：Agent 循环中，最大的浪费不是 Prompt 写得差，而是「原始数据直接入上下文」——没有压缩，没有过滤，token 白烧
- **Thesis**：融合 GraphRAG + 四层压缩，构建通用 Agent 的「双引擎」架构，让检索更精准、上下文更瘦

### 2. RTK + CodeGraph：两把刀，指向同一个问题 (~300 words)
- RTK 的核心：bash 输出 → 结构化截断 + KV 提取 → token 减少 60-80%
- CodeGraph 的核心：代码知识图谱 → 查图替代跑命令 → Agent 循环次数减半
- 两者的共同洞察：**LLM 不需要看原始数据，它需要看「对它有用的信息」**
- 结合效果：减少循环次数（CodeGraph）× 每轮 token 更少（RTK）= 复利节省

### 3. 双层架构：先优化检索，再决策压缩 (~300 words)
- **第一层：GraphRAG 优化 RAG 本身**
  - 传统 RAG 的问题：向量相似度检索在复杂关系查询上力不从心
  - GraphRAG：社区摘要 + 实体关系图，一次检索代替多次工具调用
  - 效果：减少工具调用次数，提升 retrieval precision
- **第二层：压缩决策门**
  - 判断条件：当前 agent 循环是否结束？
  - 若是最终输出 → 不压缩，直接返回给用户（保留完整性）
  - 若还有后续循环 → 触发四层压缩管道（进入下一节）
  - 架构图：`Retrieve → [Last Step?] → Yes: Output / No: Compression Pipeline → Next Loop`

### 4. 四层压缩管道详解 (~500 words)

#### Layer 1：Graph Pruning（图剪枝）
- 仅在使用 GraphRAG 时启用
- 剔除与当前任务无关的社区节点和边
- 工具：NetworkX 图过滤 / GraphRAG 自带 pruning API
- 效果：减少传入下层的原始文本量

#### Layer 2：领域 Profile 压缩
- 针对特定行业/场景定制（法律、金融、客服……）
- 职责：业务元数据提取 + 噪声屏蔽
- 示例（金融场景）：保留「金额、日期、交易方、条款」，丢弃格式声明、免责声明
- 实现：规则引擎 + 小型 NER 模型，可热插拔

#### Layer 3：通用压缩
- 文本脱水：删除冗余连接词、重复表述
- 格式净化：移除 markdown 装饰、多余空白
- 数字/符号聚合：`1, 2, 3, 4, 5` → `[1-5]`
- 工具参考：LLMLingua、自定义 regex pipeline

#### Layer 4：小模型智能压缩（Subagent 模式）
- 选型原则：推理速度极快、token 极廉价、上下文窗口够大（≥32K）
- 候选模型：Qwen2.5-7B-Instruct、Phi-4-mini、Gemma-3-4B
- 工程约束：
  - 作为独立 subagent 启动，**只做压缩这一件事**
  - 任务完成后立即关闭，不共享主 agent 上下文
  - Prompt 极简：`将以下内容压缩为核心信息，保留所有关键事实，去除冗余表述：{text}`
- 效果：处理前三层漏掉的语义冗余，最终压缩率可达 5-10x

### 5. 适用场景与局限 (~150 words)
- **适合**：长任务 Agent、多轮工具调用、信息密集型检索（法律/金融/技术文档）
- **不适合**：简单单轮问答（压缩开销 > 收益）、实时性要求极高的场景
- **局限**：Layer 4 小模型压缩引入额外延迟，需要基准测试确认 ROI
- **监控建议**：记录每层 token in/out，用 OpenTelemetry 追踪压缩率与答案质量的 tradeoff

### 6. Conclusion (~100 words)
- 总结：双引擎 = GraphRAG 减少工具调用 + 四层压缩降低 token 消耗，两者复利叠加
- 核心心智模型：**Agent 是流水线，压缩是流水线中的一个 stage，不是 LLM 的副业**
- 下一步：.NET 实现篇（SemanticKernel + GraphRAG + LLMLingua 集成方案）

---

## Images/Diagrams Needed
- [ ] 图1：RTK vs CodeGraph 对比示意（横轴：优化维度；纵轴：节省比例）
- [ ] 图2：双层架构流程图（GraphRAG → 压缩决策门 → 四层管道）
- [ ] 图3：四层压缩管道各层职责与示例输入输出
