# ui-prototype skill（Emil prototype 改名版）

本仓库是 `https://github.com/emilkowalski/skills` 中 `prototype` 技能的本地改名副本。

- 上游技能名：`prototype`
- 本仓库技能名：`ui-prototype`
- 改动内容：
  1. 目录 `skills/prototype` → `skills/ui-prototype`
  2. `SKILL.md` frontmatter `name: prototype` → `name: ui-prototype`
- 上游 commit：`78761e1b57f97dce65b983d640c70a68f39e8163`
- 许可证：[MIT License](LICENSE)，保留 Emil Kowalski 的版权署名

## 为什么改名

本机已有 MTT 智能库的 `prototype` 技能，两者体系/作用不同。为了共存，
将 Emil UI 库的 prototype 以 `ui-prototype` 名称安装，避免覆盖。

## 如何让 CLI 管理该技能

由于 `skills` CLI 1.5.22 只以 SKILL.md frontmatter 的 `name` 作为 lock key，
本仓库中的 `name: ui-prototype` 必须与目录名一致。

### 安装到 Cline

```bash
npx skills add xiaohai-uid/ui-prototype-skill -s ui-prototype -g -a cline -y
```

之后 `npx skills list -g` / `update` / `remove` 都能管理它。

### 从上游同步更新

```bash
# 在本仓库根目录执行，将上游放在相邻目录
git clone https://github.com/emilkowalski/skills.git ../emil-skills
# 先核对工作区是否干净。同步脚本会暂存工作区变更并创建提交。
git status --short
bash scripts/sync-upstream.sh ../emil-skills
```
