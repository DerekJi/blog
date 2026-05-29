# Brainstorm: 双引擎 Agent——用四层压缩让通用 Agent 又快又省

## Topic
RTK 和 CodeGraph 最近都大火：
- **RTK**：压缩 bash 命令的输出，大幅降低 Agent 喂给 LLM 的 token 数量
- **CodeGraph**：减少 bash 操作次数，降低 Agent 循环轮数

两者方向不同，但目标一致——让 Agent 循环更高效。如果把两者的思想融合，并推广到**通用型（非编码类）Agent**，能做出什么？

核心主张：将 GraphRAG 与分层压缩结合，构建一个「双引擎」架构——第一引擎优化检索，第二引擎压缩上下文——让 Agent 在长任务中既减少工具调用，又压低 token 消耗。

## Target Audience
构建通用 Agent / AI Workflow 的工程师；关注 LLM 成本与延迟优化的架构师；.NET/云原生背景，但有 AI 工程实践经验。

## Angles / Hooks (3-5 options)
1. **成本角度**：大多数人优化 Prompt，没人优化「数据管道」——RTK 和 CodeGraph 告诉你，真正的省钱在检索和压缩层
2. **架构角度**：Agent 不是一个 LLM，而是一条流水线；把压缩当成流水线中的独立 stage，比塞进 system prompt 优雅得多
3. **反直觉角度**：用一个小模型做压缩，比让大模型「自己总结」更快更省——subagent 模式的正确用法
4. **通用化角度**：RTK/CodeGraph 是给 coding agent 设计的，但压缩思路完全可以移植到客服、法律、金融等行业 agent

## Competitor / Reference Research
- **RTK (Reduce Token)**：压缩 bash 输出，核心是 structured output truncation + key-value extraction
- **CodeGraph**：构建代码知识图谱，Agent 查图而非跑命令，减少循环次数
- **GraphRAG (Microsoft)**：社区摘要 + 全局问答，比传统 RAG 更适合复杂关系查询
- **LLMLingua / LongLLMLingua**：通用 prompt 压缩，token 减少 20x 同时保留关键信息
- **MemGPT / Letta**：分层记忆管理，与本文的分层压缩思路有共鸣

## Key Points to Cover
- [ ] RTK 和 CodeGraph 的核心机制各是什么，解决了什么问题
- [ ] 为什么两者结合能产生「1+1>2」的效果
- [ ] 双层架构：第一层优化 RAG，第二层决策是否压缩
- [ ] 四层压缩详解：Graph Pruning → 领域 Profile 压缩 → 通用压缩 → 小模型智能压缩
- [ ] 小模型 subagent 的工程实现要点（隔离上下文、用完即关）
- [ ] 适用场景与局限性

## "Aha!" Moment
「你一直在优化 Prompt，但 Agent 最大的浪费根本不在 Prompt 里——在你把原始数据直接塞进上下文的那一刻。」

压缩不是 LLM 的工作，压缩是流水线的工作。

## Series or Standalone?
- [ ] Single article (1500-1800 words)
- [x] Part 1 of a series（后续可出：具体实现篇、.NET 集成篇）

## AI Discussion Notes
- 2026-05-29：用户提出将 RTK（token 压缩）+ CodeGraph（减少工具调用）的思路推广到通用 Agent
- 双层入口：第一层 GraphRAG 优化检索，第二层根据是否是最终输出决定是否压缩
- 四层压缩方案：Graph Pruning → 领域 Profile 压缩 → 通用压缩 → 小模型 subagent 压缩
- 小模型选型建议：推理快、token 极廉价、上下文窗口够大，如 Qwen2.5-7B-Instruct、Phi-4-mini 等
- 关键工程约束：subagent 用完即关，不共享上下文，避免污染主 agent 的对话历史
