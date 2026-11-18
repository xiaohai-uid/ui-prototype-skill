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
# 拉取上游
git remote add upstream https://github.com/emilkowalski/skills.git 2>/dev/null || true
git fetch upstream
# 手动复制并改名（也可用 scripts/sync-upstream.sh）
mkdir -p skills/ui-prototype
cp upstream-src/skills/prototype/SKILL.md skills/ui-prototype/SKILL.md
cp upstream-src/skills/prototype/PICKER.md skills/ui-prototype/PICKER.md
# 修改 name
sed -i 's/^name: prototype$/name: ui-prototype/' skills/ui-prototype/SKILL.md
git add -A && git commit -m "sync: update ui-prototype from upstream"
```
